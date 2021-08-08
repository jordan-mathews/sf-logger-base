public with sharing class Log {
  public LogLevel level { get; set; }
  public String message { get; set; }
  private Quiddity quiddity;
  private String requestId;

  public Log(String message) {
    this.message = message;
    this.level = LogLevel.INFO;
    this.quiddity = getQuiddity();
    this.requestId = getRequestId();
  }

  public Log(String message, LogLevel logLevel) {
    this(message);
    this.level = logLevel;
  }

  public Log(Exception ex) {
    this(String.valueOf(ex), LogLevel.ERROR);
  }

  public Log__e event() {
    return new Log__e(
      Message__c = this.message,
      RequestId__c = this.requestId,
      Quiddity__c = this.quiddity?.name(),
      LogLevel__c = this.level?.name()
    );
  }

  private String getRequestId() {
    if (requestId == null) {
      requestId = Request.getCurrent().getRequestId();
    }
    return requestId;
  }

  private Quiddity getQuiddity() {
    if (quiddity == null) {
      quiddity = Request.getCurrent().getQuiddity();
    }
    return quiddity;
  }
}