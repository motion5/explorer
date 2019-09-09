const express = require('express');
const path = require('path');
app = express();
const port = 80;
const axios = require('axios');
const host = 'http://api';
// const host = process.env.API || 'http://explorer-api';

console.log("API", process.env.API);

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname + '/index.html'));
    // res.send('Welcome to basic API');
});

app.get('/action-1', (req, res) => {
    return res.json({
        data: {
        }
    })
});

app.get('/action-2', (req, res) => {
    return axios.get(`${host}/action-1`)
        .then(response => {
            console.log('in then', response.data);
            let data = response.data;
            return res.json({ data })
        }).catch(response => {
            console.log('in catch', response);
            return res.json({error: response});
        });
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));