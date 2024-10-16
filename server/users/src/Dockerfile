# Use the .NET SDK image for building the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env

# Set the working directory inside the container
WORKDIR /src

# Copy everything from the current directory to the container
COPY . ./

# Restore dependencies
RUN dotnet restore

# Build and publish the service
RUN dotnet publish -c Release -o out

# Use the .NET runtime image for running the application
FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Set the working directory inside the container
WORKDIR /src

# Copy the build output from the build stage to the runtime stage
COPY --from=build-env /src/out .

# Set the entry point for the container to run the application
ENTRYPOINT ["dotnet", "users.dll"]