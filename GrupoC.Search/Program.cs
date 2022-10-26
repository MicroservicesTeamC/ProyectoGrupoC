using GrupoC.Search.Exceptions;
using GrupoC.Search.Interfaces;
using GrupoC.Search.Logs;
using GrupoC.Search.Services;
using Polly;
using Polly.Extensions.Http;
using NLog;


var builder = WebApplication.CreateBuilder(args);

LogManager.LoadConfiguration(string.Concat(Directory.GetCurrentDirectory(), "/nlog.config"));


var retryPolicy = GetRetryPolicy();
var circuitBreakerPolicy = GetCircuitBreakerPolicy();

ConfigurationManager configuration = builder.Configuration;
// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddHttpClient("estanteriasService", c =>
{
    c.BaseAddress = new Uri(configuration["Services:Estanterias"]);
})
    .SetHandlerLifetime(TimeSpan.FromMinutes(5))
    .AddPolicyHandler(retryPolicy)
    .AddPolicyHandler(circuitBreakerPolicy);
builder.Services.AddHttpClient("productosService", c =>
{
    c.BaseAddress = new Uri(configuration["Services:Productos"]);
})
    .SetHandlerLifetime(TimeSpan.FromMinutes(5))
    .AddPolicyHandler(retryPolicy)
    .AddPolicyHandler(circuitBreakerPolicy); 
builder.Services.AddHttpClient("albaranService", c =>
{
    c.BaseAddress = new Uri(configuration["Services:Albaranes"]);
})
    .SetHandlerLifetime(TimeSpan.FromMinutes(5))
    .AddPolicyHandler(retryPolicy)
    .AddPolicyHandler(circuitBreakerPolicy); 

LogManager.LoadConfiguration(string.Concat(Directory.GetCurrentDirectory(), "/nlog.config"));
builder.Services.AddSingleton<ILoggerManager, LoggerManager>(); 
builder.Services.AddScoped<IEstanteriaService, EstanteriaService>();
builder.Services.AddScoped<IProductoService, ProductosService>();
builder.Services.AddScoped<IAlbaranService, AlbaranService>();

var app = builder.Build();



if (app.Environment.IsProduction())
{
    app.UseExceptionMiddleware();
}


app.UseAuthorization();

app.MapControllers();

app.Run();



//métodos
static IAsyncPolicy<HttpResponseMessage> GetCircuitBreakerPolicy()
{
    return HttpPolicyExtensions
        .HandleTransientHttpError()
        .CircuitBreakerAsync(2, TimeSpan.FromSeconds(5));
}

static IAsyncPolicy<HttpResponseMessage> GetRetryPolicy()
{
    return HttpPolicyExtensions
        .HandleTransientHttpError()
        .OrResult(msg => msg.StatusCode == System.Net.HttpStatusCode.NotFound)
        .WaitAndRetryAsync(2, retryAttempt => TimeSpan.FromSeconds(Math.Pow(2,
            retryAttempt)));
}
