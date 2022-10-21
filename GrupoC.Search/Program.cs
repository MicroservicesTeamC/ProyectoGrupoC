using GrupoC.Search.Interfaces;
using GrupoC.Search.Logs;
using GrupoC.Search.Services;
using NLog;

var builder = WebApplication.CreateBuilder(args);

LogManager.LoadConfiguration(string.Concat(Directory.GetCurrentDirectory(), "/nlog.config"));

ConfigurationManager configuration = builder.Configuration;
// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddHttpClient("estanteriasService", c =>
{
    c.BaseAddress = new Uri(configuration["Services:Estanterias"]);
});
builder.Services.AddHttpClient("productosService", c =>
{
    c.BaseAddress = new Uri(configuration["Services:Productos"]);
});
builder.Services.AddHttpClient("albaranService", c =>
{
    c.BaseAddress = new Uri(configuration["Services:Albaranes"]);
});

LogManager.LoadConfiguration(string.Concat(Directory.GetCurrentDirectory(), "/nlog.config"));
builder.Services.AddSingleton<ILoggerManager, LoggerManager>(); 
builder.Services.AddScoped<IEstanteriaService, EstanteriaService>();
builder.Services.AddScoped<IProductoService, ProductosService>();
builder.Services.AddScoped<IAlbaranService, AlbaranService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.UseAuthorization();

app.MapControllers();

app.Run();
