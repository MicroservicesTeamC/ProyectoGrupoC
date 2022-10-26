using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using Azure.Core;
using GrupoC.Estanteria.DAL;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

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
string? Uri = "https://clavesgrupoc.vault.azure.net";
if (Uri is not null)
{
    var client = new SecretClient(new Uri(Uri), new DefaultAzureCredential(), options);
    KeyVaultSecret secret = client.GetSecret("ConnectionStringEstanterias");
    secretValue = secret.Value;
}




builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddScoped<IEstanteriaProvider, EstanteriaProvider>();
builder.Services.AddDbContext<EstanteriaContext>(options =>
                    options.UseSqlServer(secretValue)
);


var app = builder.Build();

// Configure the HTTP request pipeline.


app.UseAuthorization();

app.MapControllers();

app.Run();
