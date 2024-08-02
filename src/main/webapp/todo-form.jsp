<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Todo Form</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
  </head>
  <body>
    <div class="container mt-5">
      <h2 class="mb-4">${todo == null ? 'Add New Todo' : 'Edit Todo'}</h2>
      <form action="todo" method="post">
        <input
          type="hidden"
          name="id"
          value="${todo != null ? todo.getId() : ''}"
        />
        <div class="form-group">
          <label for="title">Title</label>
          <input
            type="text"
            class="form-control"
            id="title"
            name="title"
            value="${todo != null ? todo.getTitle() : ''}"
            required
          />
        </div>
        <div class="form-group">
          <label for="description">Description</label>
          <textarea
            class="form-control"
            id="description"
            name="description"
            required
          >
${todo != null ? todo.getDescription() : ''}</textarea
          >
        </div>
        <div class="form-group form-check">
          <input type="checkbox" class="form-check-input" id="completed"
          name="completed" ${todo != null && todo.isCompleted() ? 'checked' :
          ''} />
          <label class="form-check-label" for="completed">Completed</label>
        </div>
        <button
          type="submit"
          class="btn btn-success"
          name="action"
          value="${todo != null ? 'update' : 'insert'}"
        >
          ${todo != null ? 'Update' : 'Save'}
        </button>
        <a href="todo" class="btn btn-secondary">Cancel</a>
      </form>
    </div>
  </body>
</html>
