using Azure.Core;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using GrupoC.AlbaranDeEntrega.Context;
using GrupoC.AlbaranDeEntrega.DAL;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

//SecretClientOptions options = new SecretClientOptions()
//{
//    Retry =
//    {
//        Delay= TimeSpan.FromSeconds(2),
//        MaxDelay = TimeSpan.FromSeconds(16),
//        MaxRetries = 5,
//        Mode = RetryMode.Exponential
//    }
//};

//string secretValue = "";
//string? Uri = Environment.GetEnvironmentVariable("KEY_VAULT_URI", EnvironmentVariableTarget.User);
//if(Uri is not null)
//{
//    var client = new SecretClient(new Uri(Uri), new DefaultAzureCredential(), options);
//    KeyVaultSecret secret = client.GetSecret(Environment.GetEnvironmentVariable("SECRET_ALBARAN", EnvironmentVariableTarget.User));
//    secretValue = secret.Value;
//}

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IAlbaranProvider, AlbaranProvider>();
builder.Services.AddDbContext<AlbaranContext>(options =>
                    options.UseSqlServer("Server=tcp:productosgrupoc.database.windows.net,1433;Initial Catalog=Albaranes;Persist Security Info=False;User ID=admingrupoc;Password=Grupocadmin00;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;")
);

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
