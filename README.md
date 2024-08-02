# Todo App - Logging Documentation
## Elie Kwibuka: 24346
## 1. What is Logging?

**Logging** is the process of recording events, activities, and information about the execution of a program. In software development, logging is used to capture detailed information about the application's runtime behavior, which helps in monitoring, troubleshooting, and debugging.

Logs can include various types of information, such as:
- **Error messages** when something goes wrong.
- **Information messages** about the application's general status.
- **Debugging details** to understand how different parts of the application are functioning.

## 2. Why Logging is Important

Logging is crucial for several reasons:
- **Debugging:** It helps developers trace and diagnose problems by providing detailed information about the application's state and behavior.
- **Monitoring:** Logs can be used to monitor the performance and health of an application over time, allowing for proactive management and optimization.
- **Audit Trails:** Logging provides a historical record of events, which can be essential for security auditing and compliance with regulations.
- **Error Reporting:** Logs capture exceptions and errors, making it easier to identify and address issues that affect the application's functionality and user experience.

## 3. Understanding Logging Levels

Logging levels categorize the severity and type of information recorded in logs. Common logging levels include:
- **TRACE:** Provides the most detailed information about the application's operations, useful for deep debugging.
- **DEBUG:** Offers detailed information for diagnosing issues and understanding application flow.
- **INFO:** Records general information about application events and state, typically used for monitoring.
- **WARN:** Indicates potential issues or important events that may require attention.
- **ERROR:** Captures error messages and exceptions that signify problems needing resolution.
- **FATAL:** Records critical errors that cause the application to terminate prematurely or become unusable.

Choosing the appropriate logging level helps in filtering and focusing on relevant information based on the context and needs of the application.

## 4. Setting Up a Logger in Java

To incorporate logging into a Java application, you can use the built-in `java.util.logging` package or popular third-party libraries like Log4j or SLF4J. Here’s how to set up a logger using `java.util.logging`:

1. **Add a Logger to Your Classes:**
   Define a `Logger` instance in your Java classes where you want to record logs. For example:

   ```java
   private static final Logger logger = Logger.getLogger(YourClassName.class.getName());


## Log messages:
logger.info("This is an info message.");
logger.warning("This is a warning message.");
logger.severe("This is an error message.");

## Handling Exception: 
try {
    // Code that may throw an exception
} catch (Exception e) {
    logger.log(Level.SEVERE, "An error occurred", e);
}

## Configuring output dest:

handlers= java.util.logging.ConsoleHandler, java.util.logging.FileHandler
.level = INFO
java.util.logging.ConsoleHandler.level = INFO
java.util.logging.ConsoleHandler.formatter = java.util.logging.SimpleFormatter
java.util.logging.FileHandler.level = FINE
java.util.logging.FileHandler.formatter = java.util.logging.SimpleFormatter
java.util.logging.FileHandler.pattern = myapp.log
