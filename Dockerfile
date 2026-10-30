FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY newki-mcp/newki-mcp.csproj newki-mcp/
RUN dotnet restore newki-mcp/newki-mcp.csproj
COPY newki-mcp/ newki-mcp/
RUN dotnet publish newki-mcp/newki-mcp.csproj -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app
ENV ASPNETCORE_URLS=http://+:8020
EXPOSE 8020
COPY --from=build /app/publish .
USER $APP_UID
ENTRYPOINT ["dotnet", "newki-mcp.dll"]
