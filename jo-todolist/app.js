"use strict";
const jsonStringify = require('json-stringify');
const express = require('express');
const bodyParser = require('body-parser');
const escape = require('escape-html');
const urlencodedParser = bodyParser.urlencoded({ extended: false });

const app = express();

let todolist = [];

/* The to do list and the form are displayed */
app.get('/todo', function(req, res) {
    res.render('todo.ejs', { todolist, clickHandler:"func1();" });
})

/* Adding an item to the to do list */
.post('/todo/add/', urlencodedParser, function(req, res) {
    if (req.body.newtodo != '') {
        var html_escape = escape(req.body.newtodo);
        todolist.push(html_escape);
    }
    res.redirect('/todo');
})

/* Clear all items on the to do list */
.post('/todo/clear/', urlencodedParser, function(req, res) {
    todolist.push(todolist = []);
    res.redirect('/todo');
})

/* Deletes an item from the to do list */
.get('/todo/delete/:id', function(req, res) {
    if (req.params.id != '') {
        todolist.splice(req.params.id, 1);
    }
    res.redirect('/todo');
})

/* Edit an item from the to do list */
.post('/todo/edit/:id', urlencodedParser, function(req, res) {
    var html_escape = escape(req.body.updatetodo);
    if (req.params.id != '') {
        if (html_escape != '') {
            todolist[req.params.id] = html_escape;
        }
    }
    res.redirect('/todo');
})

/* Redirects to the to do list if the page requested is not found */
.use(function(req, res, next){
    res.redirect('/todo');
})

.listen(8080);
