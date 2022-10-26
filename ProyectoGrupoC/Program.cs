using Azure.Core;
using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using GrupoC.AlbaranDeEntrega.Context;
using GrupoC.AlbaranDeEntrega.DAL;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

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

string secretValue = "";
string? Uri = "https://clavesgrupoc.vault.azure.net/";
if (Uri is not null)
{
    var client = new SecretClient(new Uri(Uri), new DefaultAzureCredential(), options);
    KeyVaultSecret secret = client.GetSecret("ConnectionStringAlbaranes");
    secretValue = secret.Value;
}

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddScoped<IAlbaranProvider, AlbaranProvider>();
builder.Services.AddDbContext<AlbaranContext>(options =>
                    options.UseSqlServer(secretValue)
);

var app = builder.Build();




app.UseAuthorization();

app.MapControllers();

app.Run();
