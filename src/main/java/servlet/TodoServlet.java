package servlet;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.TodoDao;
import model.Todo;

@SuppressWarnings("unused")
@WebServlet("/todo")
public class TodoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(TodoServlet.class.getName());
    private TodoDao todoDao;

    public void init() {
        todoDao = new TodoDao();
        logger.info("TodoServlet initialized");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.info("Handling GET request");
        listTodo(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.info("Handling POST request");
        insertTodo(request, response);
    }

    private void listTodo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Todo> listTodo = todoDao.getAllTodos();
        request.setAttribute("listTodo", listTodo);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        logger.info("Forwarded listTodo to index.jsp");
    }

    private void insertTodo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        boolean completed = Boolean.parseBoolean(request.getParameter("completed"));

        Todo newTodo = new Todo();
        newTodo.setTitle(title);
        newTodo.setDescription(description);
        newTodo.setCompleted(completed);
        todoDao.saveTodo(newTodo);
        logger.info("Todo inserted: " + newTodo);
        response.sendRedirect("todo");
    }
}
