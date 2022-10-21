using Azure.Core;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using GrupoC.AlbaranDeEntrega.Context;
using GrupoC.AlbaranDeEntrega.DAL;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
string uri = "https://clavesgrupoc.vault.azure.net/";

SecretClientOptions options = new SecretClientOptions()
{
    Retry =
    {
        Delay= TimeSpan.FromSeconds(2),
        MaxDelay = TimeSpan.FromSeconds(16),
        MaxRetries = 5,
        Mode = RetryMode.Exponential
    }
};
var client = new SecretClient(new Uri(uri), new DefaultAzureCredential(), options);

KeyVaultSecret secret = client.GetSecret("ConnectionStringAlbaranes");

string secretValue = secret.Value;


// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IAlbaranProvider, AlbaranProvider>();
builder.Services.AddDbContext<AlbaranContext>(options =>
                    options.UseSqlServer(secretValue)
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
