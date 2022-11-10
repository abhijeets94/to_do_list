const e = require("express");
const express = require("express");

const todoRouter = express.Router();
const Todo = require("../models/todo")


todoRouter.post("/api/add-todo", async (req, res) => {
    try {
        
        const { todo, description, status, dueDate, } = req.body;
        // Todo.findOne(todo);
        let notes = new Todo(
            {todo,
            description,
            dueDate,
            status,
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
        res.json(notes)
    } catch (error) {
        res.status(500).json({error: error.message});
    }
});


todoRouter.put("/api/done", async (req, res) => {
    try {
        const {id, status} = req.body;
        let notes = await Todo.findById(id);
        notes.status = status;
        notes.save();
        res.json(notes);
        
    } catch (error) {
        res.status(500).json({error: error.message});
    }

});


module.exports = todoRouter;