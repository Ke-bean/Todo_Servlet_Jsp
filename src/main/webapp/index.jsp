<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="main.java.model.Todo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Todos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        .table th, .table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Todo List</h2>
        <!-- Todo Form -->
        <div class="card mb-4">
            <div class="card-header">
                <h3>Add New Todo</h3>
            </div>
            <div class="card-body">
                <form action="todo" method="post">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" class="form-control" id="title" name="title" required />
                    </div>
                    <div class="form-group">
                        <label for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" required></textarea>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="completed" name="completed" />
                        <label class="form-check-label" for="completed">Completed</label>
                    </div>
                    <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
        <!-- Todo List -->
        <table class="table table-bordered table-hover">
            <thead class="thead-light">
                <tr>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Completed</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Todo> listTodo = (List<Todo>) request.getAttribute("listTodo");
                    if (listTodo != null) {
                        for (Todo todo : listTodo) {
                %>
                <tr>
                    <td><%= todo.getTitle() %></td>
                    <td><%= todo.getDescription() %></td>
                    <td><%= todo.isCompleted() ? "Yes" : "No" %></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
