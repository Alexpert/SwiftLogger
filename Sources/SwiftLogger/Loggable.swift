public class Loggable {
    var logger: SwiftLogger

    public init() {
        self.logger = SwiftLogger(path: "Logs/\(#file).log", domain: #file)
    }

    public init(logger: SwiftLogger) {
        self.logger = logger
    }
}