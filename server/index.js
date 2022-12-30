console.log("Check this");

const express = require("express");
const mongoose = require("mongoose");
const DB = "mongodb+srv://abhijeet:abhijeet4321@cluster0.bs1znkc.mongodb.net/?retryWrites=true&w=majority"
const todoRouter = require("./routes/todo");

const app = express();
const PORT = 3000;

mongoose.connect(DB).then(()=>{console.log("Connected to DB")}).catch((e) => {console.log(`unable to connect due to: ${e}`)});

//middleware
app.use(express.json());
app.use(todoRouter);


//server
app.listen(PORT,()=> {console.log(`connect at : ${PORT}`)});


