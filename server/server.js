const express = require('express');
const Api = require('./router_api');
const Web = require('./router_web');
const V2Api = require('./v2_router_api');
const App = express();
const PORT = process.env.PORT || 3000
const cors = require('cors');


App.use(cors());
App.use(express.static('./../build/web'));
App.use(express.urlencoded({extended: true}));
App.use(express.json())
App.use(Web);
App.use('/apiv2', V2Api);
App.use("/api", Api);

App.use((req, res, next) => res.status(404).send("404 | not found"));
App.use((req, res, next) => res.status(500).send("500 | server error"))

App.listen(PORT, () => console.log("server berjalan di port : "+ PORT));

module.exports = App