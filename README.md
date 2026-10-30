# Newki MCP Docker

Docker packaging for `../newki-mcp`.

From the parent directory:

```bash
docker compose -f newki-mcp-docker/docker-compose.yml up --build
```

Set `ConnectionStrings__DefaultConnection` in the shell or in a local `.env` file. Do not commit credentials.
