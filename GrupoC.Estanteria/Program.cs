using Azure.Identity;
using Azure.Security.KeyVault.Secrets;
using Azure.Core;
using GrupoC.Estanteria.DAL;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
string uri = "https://clavesgrupoc.vault.azure.net/";
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
var client = new SecretClient(new Uri(uri), new DefaultAzureCredential(), options);

KeyVaultSecret secret = client.GetSecret("ConnectionStringEstanterias");

string secretValue = secret.Value;


builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IEstanteriaProvider, EstanteriaProvider>();
builder.Services.AddDbContext<EstanteriaContext>(options =>
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
