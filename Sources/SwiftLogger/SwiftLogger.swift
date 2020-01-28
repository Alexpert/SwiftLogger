import Foundation

public enum LogType {
    case ERROR
    case DEBUG
    case INFO
}

public class SwiftLogger {
    var enabledLogTypes: [LogType]
    var path: String
    var domain: String

    public init(path: String, domain: String, logTypes: [LogType] = []) {
        self.path = path
        self.domain = domain
        self.enabledLogTypes = logTypes
    }

    public func enableLogType(type: LogType) {
        if !enabledLogTypes.contains(type) {
            enabledLogTypes.append(type)
        }
    }

    public func disableLogType(type: LogType) {
        if enabledLogTypes.contains(type) {
            enabledLogTypes = enabledLogTypes.filter{ $0 != type}
        }
        
    }

    public func log(type: LogType, header: String, content: String) {
        if (enabledLogTypes.contains(type)) {
            let log = "\n[\(type)] \(domain.uppercased()): \(Date()) \n \t \(header): \(content)"
            let content = try! String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
            try! (content + log).write(to: URL(fileURLWithPath: path), atomically: true, encoding: .utf8)
        }
    }
}