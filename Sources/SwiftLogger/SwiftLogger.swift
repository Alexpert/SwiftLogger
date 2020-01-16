import Foundation

class SwiftLogger {
    var enabledLogTypes: [LogType]
    var path: String
    var domain: String

    init(path: String, domain: String, logTypes: [LogType] = []) {
        self.path = path
        self.domain = domain
        self.enabledLogTypes = logTypes
    }

    func enableLogType(type: LogType) {
        if !enabledLogTypes.contains(type) {
            enabledLogTypes.append(type)
        }
    }

    func disableLogType(type: LogType) {
        if enabledLogTypes.contains(type) {
            enabledLogTypes = enabledLogTypes.filter{ $0 != type}
        }
        
    }

    func log(type: LogType, header: String, content: String) {
        if (enabledLogTypes.contains(type)) {
            let log = "\n[\(type)] \(domain.uppercased()): \(Date()) \n \t \(header): \(content)"
            let content = try! String(contentsOf: URL(fileURLWithPath: path), encoding: .utf8)
            try! (content + log).write(to: URL(fileURLWithPath: path), atomically: true, encoding: .utf8)
        }
    }
}