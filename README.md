# Newki MCP Docker

Docker packaging for `../newki-mcp`.

The local `.env` file contains the database connection string and is excluded from Git. Start or rebuild the long-running container with:

```bash
./newki-mcp-docker/rundocker.sh
```

The MCP endpoint is available at `http://localhost:8020/mcp`.
