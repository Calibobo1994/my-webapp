const http = require('http');
const PORT = 80;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({
    status: "success",
    message: "HTTP Application Running on Azure ACI",
    version: "1.0.1"
  }));
});

server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});