const e = require("express");
const express = require("express");

const todoRouter = express.Router();
const Todo = require("../models/todo")


todoRouter.post("/api/add-todo", async (req, res) => {
    try {
        
        const { todo, description } = req.body;
        // Todo.findOne(todo);
        let notes = new Todo(
            {todo,
            description,
        });
        notes = await notes.save();
        res.json(notes);
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});

todoRouter.get("/api/get-todo",  async (req, res) => {
    try {
        const notes = await Todo.find();
        console.log(notes)
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});


module.exports = todoRouter;