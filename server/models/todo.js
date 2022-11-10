const mongoose = require("mongoose");

const todoSchema = mongoose.Schema({
    todo: {
        type: String,
        required: true,
    },
    description: {
        type: String,
        required: true,
    },
    dueDate: {
        type: String,
        
    },
    status: {
        type: Boolean,
        default: false,
        required: true,
    }
});

const Todo = mongoose.model("Todo", todoSchema);
module.exports = Todo;