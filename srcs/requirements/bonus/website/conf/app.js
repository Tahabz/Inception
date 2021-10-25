const http = require('http');
const fs = require("fs");

const port = process.env.PORT;
const file = fs.readFileSync("index.html");

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html');
  res.write(file);
  res.end()
});

server.listen(port, () => {
  console.log(`Server listening to port ${port}`);
});
