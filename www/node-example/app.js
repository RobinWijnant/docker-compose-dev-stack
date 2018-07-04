const express = require('express')
const app = express()

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(3000, () => {
    console.log('Example app listening on http://3000.localhost')
    console.log('Also open for other app: http://5000.localhost')
})
