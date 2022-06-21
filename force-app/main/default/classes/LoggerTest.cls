@isTest
public with sharing class LoggerTest {
  @isTest
  static void publishSingleMessage() {
    Test.startTest();
    Logger.getCurrent().publish('Test Log Message');
    Test.stopTest();
    Test.getEventBus().deliver();

    String currentRequestId = Request.getCurrent().getRequestId();
    Quiddity currentQuiddity = Request.getCurrent().getQuiddity();

    List<SystemLog__c> logs = [
      SELECT Id, RequestId__c, Quiddity__c, Message__c, LogLevel__c
      FROM SystemLog__c
      ORDER BY LogLevel__c
    ];

    System.assertEquals(1, logs.size(), 'expected to find only a single log');
    System.assertEquals(
      currentRequestId,
      logs[0].RequestId__c,
      'expecting current requestId'
    );
    System.assertEquals(
      String.valueOf(currentQuiddity),
      logs[0].Quiddity__c,
      'expecting current requestId'
    );
    System.assertEquals(
      'Test Log Message',
      logs[0].Message__c,
      'expecting current requestId'
    );
  }

  @isTest
  static void publishSingleMessageWithLogLevel() {
    Test.startTest();
    Logger.getCurrent().publish('Test Log Message', LogLevel.ERROR);
    Test.stopTest();
    Test.getEventBus().deliver();

    String currentRequestId = Request.getCurrent().getRequestId();
    Quiddity currentQuiddity = Request.getCurrent().getQuiddity();

    List<SystemLog__c> logs = [
      SELECT Id, RequestId__c, Quiddity__c, Message__c, LogLevel__c
      FROM SystemLog__c
      ORDER BY LogLevel__c
    ];

    System.assertEquals(1, logs.size(), 'expected to find only a single log');
    System.assertEquals(
      currentRequestId,
      logs[0].RequestId__c,
      'expecting current requestId'
    );
    System.assertEquals(
      String.valueOf(currentQuiddity),
      logs[0].Quiddity__c,
      'expecting current requestId'
    );
    System.assertEquals(
      'Test Log Message',
      logs[0].Message__c,
      'expecting current requestId'
    );
    System.assertEquals(
      String.valueOf(LogLevel.ERROR),
      logs[0].LogLevel__c,
      'expecting error log level'
    );
  }

  @isTest
  static void publishSingleException() {
    Test.startTest();
    Logger.getCurrent().publish(new CalloutException());
    Test.stopTest();
    Test.getEventBus().deliver();

    String currentRequestId = Request.getCurrent().getRequestId();
    Quiddity currentQuiddity = Request.getCurrent().getQuiddity();

    List<SystemLog__c> logs = [
      SELECT Id, RequestId__c, Quiddity__c, Message__c, LogLevel__c
      FROM SystemLog__c
      ORDER BY LogLevel__c
    ];

    System.assertEquals(1, logs.size(), 'expected to find only a single log');
    System.assertEquals(
      currentRequestId,
      logs[0].RequestId__c,
      'expecting current requestId'
    );
    System.assertEquals(
      String.valueOf(currentQuiddity),
      logs[0].Quiddity__c,
      'expecting current requestId'
    );
  }

  @isTest
  static void publishSingleExceptionWithLogLevel() {
    Test.startTest();
    Logger.getCurrent().publish(new CalloutException(), LogLevel.ERROR);
    Test.stopTest();
    Test.getEventBus().deliver();

    String currentRequestId = Request.getCurrent().getRequestId();
    Quiddity currentQuiddity = Request.getCurrent().getQuiddity();

    List<SystemLog__c> logs = [
      SELECT Id, RequestId__c, Quiddity__c, Message__c, LogLevel__c
      FROM SystemLog__c
      ORDER BY LogLevel__c
    ];

    System.assertEquals(1, logs.size(), 'expected to find only a single log');
    System.assertEquals(
      currentRequestId,
      logs[0].RequestId__c,
      'expecting current requestId'
    );
    System.assertEquals(
      String.valueOf(currentQuiddity),
      logs[0].Quiddity__c,
      'expecting current requestId'
    );
  }

  @isTest
  static void publishWithAddingMultipleMessages() {
    Test.startTest();
    Logger.getCurrent().add('Test Log Message 1');
    Logger.getCurrent().add('Test Log Message 2');
    Logger.getCurrent().add('Test Log Message 3');
    Logger.getCurrent().publish();
    Test.stopTest();
    Test.getEventBus().deliver();

    String currentRequestId = Request.getCurrent().getRequestId();
    Quiddity currentQuiddity = Request.getCurrent().getQuiddity();

    List<SystemLog__c> logs = [
      SELECT Id, RequestId__c, Quiddity__c, Message__c, LogLevel__c
      FROM SystemLog__c
      ORDER BY LogLevel__c
    ];

    System.assertEquals(3, logs.size(), 'expected to find only a single log');
  }

  @isTest
  static void publishWithAddingMultipleExceptions() {
    Test.startTest();
    Logger.getCurrent().add(new CalloutException());
    Logger.getCurrent().add(new CalloutException());
    Logger.getCurrent().add(new CalloutException());
    Logger.getCurrent().publish();
    Test.stopTest();
    Test.getEventBus().deliver();

    String currentRequestId = Request.getCurrent().getRequestId();
    Quiddity currentQuiddity = Request.getCurrent().getQuiddity();

    List<SystemLog__c> logs = [
      SELECT Id, RequestId__c, Quiddity__c, Message__c, LogLevel__c
      FROM SystemLog__c
      ORDER BY LogLevel__c
    ];

    System.assertEquals(3, logs.size(), 'expected to find only a single log');
  }

  @isTest
  static void publishWithAddingMultipleMessagesLogLevel() {
    Test.startTest();
    Logger.getCurrent().add('Test Log Message 1', LogLevel.ERROR);
    Logger.getCurrent().add('Test Log Message 2', LogLevel.ERROR);
    Logger.getCurrent().add('Test Log Message 3', LogLevel.ERROR);
    Logger.getCurrent().publish();
    Test.stopTest();
    Test.getEventBus().deliver();

    String currentRequestId = Request.getCurrent().getRequestId();
    Quiddity currentQuiddity = Request.getCurrent().getQuiddity();

    List<SystemLog__c> logs = [
      SELECT Id, RequestId__c, Quiddity__c, Message__c, LogLevel__c
      FROM SystemLog__c
      ORDER BY LogLevel__c
    ];

    System.assertEquals(3, logs.size(), 'expected to find only a single log');
  }

  @isTest
  static void publishWithAddingMultipleExceptionsLogLevel() {
    Test.startTest();
    Logger.getCurrent().add(new CalloutException(), LogLevel.ERROR);
    Logger.getCurrent().add(new CalloutException(), LogLevel.ERROR);
    Logger.getCurrent().add(new CalloutException(), LogLevel.ERROR);
    Logger.getCurrent().publish();
    Test.stopTest();
    Test.getEventBus().deliver();

    String currentRequestId = Request.getCurrent().getRequestId();
    Quiddity currentQuiddity = Request.getCurrent().getQuiddity();

    List<SystemLog__c> logs = [
      SELECT Id, RequestId__c, Quiddity__c, Message__c, LogLevel__c
      FROM SystemLog__c
      ORDER BY LogLevel__c
    ];

    System.assertEquals(3, logs.size(), 'expected to find only a single log');
  }
}
