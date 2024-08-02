<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Todo List</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h2 class="mb-4">Todo List</h2>
      <a href="todo?action=new" class="btn btn-primary mb-4">Add New Todo</a>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Title</th>
            <th>Description</th>
            <th>Completed</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="todo" items="${listTodo}">
            <tr>
              <td>${todo.title}</td>
              <td>${todo.description}</td>
              <td>${todo.completed}</td>
              <td>
                <a
                  href="todo?action=edit&id=${todo.id}"
                  class="btn btn-warning btn-sm"
                  >Edit</a
                >
                <a
                  href="todo?action=delete&id=${todo.id}"
                  class="btn btn-danger btn-sm"
                  >Delete</a
                >
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </body>
</html>
