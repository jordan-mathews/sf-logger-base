public with sharing class Logger {
  private static Logger current;
  private List<Log> logList;

  public Logger() {
    this.logList = new List<Log>();
  }

  public Logger getCurrent() {
    if (current == null) {
      current = new Logger();
    }
    return current;
  }

  public void add(String message) {
    this.add(message, null);
  }

  public void add(String message, LogLevel level) {
    Log log = new Log(message);
    if (level != null) {
      log.level = level;
    }
    logList.add(log);
  }

  public void add(Exception ex) {
    this.add(ex, null);
  }

  public void add(Exception ex, LogLevel level) {
    Log log = new Log(ex);
    if (level != null) {
      log.level = level;
    }
    logList.add(log);
  }

  public void publish() {
    List<SObject> logs = new List<SObject>();
    for (Log msg : this.logList) {
      logs.add(msg.event());
    }
    EventBus.publish(logs);
    this.logList.clear();
  }

  public void publish(String message) {
    this.publish(message, null);
  }

  public void publish(String message, LogLevel level) {
    this.add(message, level);
    this.publish();
  }

  public void publish(Exception ex) {
    this.publish(ex, null);
  }

  public void publish(Exception ex, LogLevel level) {
    this.add(ex, level);
    this.publish();
  }
}