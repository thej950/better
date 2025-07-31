// index.js
require('dd-trace').init(); // Datadog APM
const bugsnag = require('@bugsnag/js');
const bugsnagClient = bugsnag('YOUR_API_KEY');

const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Hello, DevOps!');
});

app.use(bugsnagClient.requestHandler);
app.use(bugsnagClient.errorHandler);

app.listen(3000, () => console.log('Server started on port 3000'));
