let express = require('express')
let ua = require('universal-analytics')

let app = express()
let visitor = ua('UA-34321454-1', 'user1', {strictCidFormat: false, https: false});

app.get('/fast', function(req ,res) {
    res.send('OK')
})

app.get('/slow', function(req, res) {
    //This line will simply fire HTTP request to Google Analytics
    visitor.pageview('/slow').send()
    res.send('OK')
})

app.listen(3000, function() {
    console.log("Server started at port 3000")
})