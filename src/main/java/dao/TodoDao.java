package dao;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.Todo;
import util.HibernateUtil;

public class TodoDao {
    private static final Logger logger = Logger.getLogger(TodoDao.class.getName());

    @SuppressWarnings("deprecation")
    public void saveTodo(Todo todo) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.save(todo);
            transaction.commit();
            logger.info("Todo saved successfully: " + todo);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            logger.log(Level.SEVERE, "Error saving todo: " + todo, e);
        }
    }

    @SuppressWarnings("deprecation")
    public void updateTodo(Todo todo) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(todo);
            transaction.commit();
            logger.info("Todo updated successfully: " + todo);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            logger.log(Level.SEVERE, "Error updating todo: " + todo, e);
        }
    }

    @SuppressWarnings("deprecation")
    public void deleteTodo(Long id) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Todo todo = session.get(Todo.class, id);
            if (todo != null) {
                session.delete(todo);
                transaction.commit();
                logger.info("Todo deleted successfully: " + todo);
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            logger.log(Level.SEVERE, "Error deleting todo with ID: " + id, e);
        }
    }

    public Todo getTodoById(Long id) {
        Transaction transaction = null;
        Todo todo = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            todo = session.get(Todo.class, id);
            transaction.commit();
            logger.info("Fetched todo: " + todo);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            logger.log(Level.SEVERE, "Error fetching todo with ID: " + id, e);
        }
        return todo;
    }

    @SuppressWarnings({ "unchecked", "deprecation" })
    public List<Todo> getAllTodos() {
        Transaction transaction = null;
        List<Todo> todos = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            todos = session.createQuery("from Todo").list();
            transaction.commit();
            logger.info("Fetched all todos");
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            logger.log(Level.SEVERE, "Error fetching all todos", e);
        }
        return todos;
    }
}
