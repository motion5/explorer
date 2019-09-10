const express = require('express');
const path = require('path');
app = express();
const port = 80;
const axios = require('axios');

app.get('/action-1', (req, res) => {
    console.log('action-1 hit');
    return res.json({
      name: 'Slate Apps Test',
      purpose: 'Provide a PoC to show inter-pod communication through exposed cluster services',
      method: 'Client makes AJAX request to API running on explorer API service'
    })
});

app.listen(port, () => console.log(`API listening on ${port}!`));
