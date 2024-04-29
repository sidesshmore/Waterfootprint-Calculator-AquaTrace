const express=require('express');
const router = require('./routes/getFootprint');
const app=express();
require('dotenv').config();
const PORT=process.env.PORT;
const cors=require('cors')
const compression=require('compression')

app.use(express.json());
app.use(cors())
app.use(compression())

app.use('/',router);

app.get('/',(req,res)=>{
    res.send('Hello World');
})

app.listen(PORT,()=>{
    console.log(`Server listening on port ${PORT}`)
});