# Use the .NET SDK image for building the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Set the working directory inside the container
WORKDIR /src

# Copy the project file and restore dependencies
COPY ["server/users/src/users.csproj", "server/users/src/"]
RUN dotnet restore "server/users/src/users.csproj"

# Copy the remaining source code to the container
COPY . .

# Set the working directory to the project folder
WORKDIR "/src/server/users/src"

# Build the project in Release mode and output to /app/build
RUN dotnet build "users.csproj" -c Release -o /app/build

# Use the .NET runtime image for running the application
FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Set the working directory inside the container
WORKDIR /app

# Copy the build output from the build stage to the runtime stage
COPY --from=build /app/build .

# Expose port 80 for the application
EXPOSE 80

# Set the entry point for the container to run the application
ENTRYPOINT ["dotnet", "users.dll"]