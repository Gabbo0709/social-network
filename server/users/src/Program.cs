var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

Console.WriteLine("Hello, World! Again The Revenge Esta es la buena ahora si, pero neta ahora sí de huevos que sí, pero neta que ahora sí es el bueno pero ahora sí neta que sí wey deveras te lo prometo de veras neta que ahora sí debe jalar si no me meto un tiro en la cabeza pero te juro que ahora sí es el bueno pero ahora sí neta que sí wey deveras te lo prometo de veras neta que ahora sí debe jalar pero deveras wey nete eh que conste, pero de huevos que sí eh, ahora sí, creo que ahora sí es el bueno, pero ahora sí neta que sí wey deveras te lo prometo de veras neta que ahora sí debe jalar si no me meto un tiro, creo que ahora sí es el bueno, pero ahora sí neta que sí wey deveras te lo prometo de veras neta que ahora sí debe jalar si no me meto un tiro, fingir demencia, tres veces");

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

var summaries = new[]
{
    "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
};

app.MapGet("/weatherforecast", () =>
{
    var forecast =  Enumerable.Range(1, 5).Select(index =>
        new WeatherForecast
        (
            DateOnly.FromDateTime(DateTime.Now.AddDays(index)),
            Random.Shared.Next(-20, 55),
            summaries[Random.Shared.Next(summaries.Length)]
        ))
        .ToArray();
    return forecast;
})
.WithName("GetWeatherForecast")
.WithOpenApi();

app.Run();

record WeatherForecast(DateOnly Date, int TemperatureC, string? Summary)
{
    public int TemperatureF => 32 + (int)(TemperatureC / 0.5556);
}
