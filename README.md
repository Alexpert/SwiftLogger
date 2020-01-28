# SwiftLogger

A shitty yet useful Logger library for your swift projects.
Should not be used in production.

## Installation

Add it to your project's dependencies in "package.swift" and build your project.

## How to Use

You can use 3 Different Types of logs:

``` swift
public enum LogType {
    case ERROR
    case DEBUG
    case INFO
}
```

Create a SwiftLogger object

``` swift
let logger = SwiftLogger(path: "test.log", domain: "Test", logTypes: [LogType.ERROR])
```

- path is the path to your log file
- domain is some kind of title: it might be the name of the class you are debugging
- logTypes is the list of LogTypes you want to write to your log file

You can modify the logTypes list with:

``` swift
logger.enableLogType(type: LogType.ERROR)
logger.disableLogType(type: LogType.ERROR)
```

Write to your logger:

``` swift
logger.log(type: LogType.ERROR, header: "function_name", content: "\(error.description)")
```

- type specifies the logType, the logger will then decide if this message should be wrote in the log file or not
- header is some kind of subtitle and designate a function name, process, etc.
- content is the main text

## TODO

- Tests: This is why you should not use this in production
- Create new file of not found
- Append properly in log files: currently I use a dirty way to do this