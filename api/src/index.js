const express = require('express');
const path = require('path');
app = express();
const port = 80;
const axios = require('axios');

app.get('/action-1', (req, res) => {
    console.log('api hit');
    return res.json({
        name: 'Rob Fallaize',
        occupation: 'Full time hustler',
        skillLevel: 100,
        swag: 100,
        wins: 13,
        losses: 0
    })
});

app.listen(port, () => console.log(`API listening on ${port}!`));