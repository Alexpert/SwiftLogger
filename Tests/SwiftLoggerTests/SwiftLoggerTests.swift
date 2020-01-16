import XCTest
@testable import SwiftLogger

final class SwiftLoggerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        // XCTAssertEqual(SwiftLogger().text, "Hello, World!")


        let logger = SwiftLogger(path: "test.log", domain: "Test", logTypes: [LogType.ERROR])
        logger.log(type: LogType.ERROR, header: "header", content: "error zef<sg<f")
        logger.log(type: LogType.INFO, header: "header", content: "info zef<zefzzefh<f")
        logger.log(type: LogType.ERROR, header: "header", content: "error zef<sg<f")
        logger.log(type: LogType.INFO, header: "header", content: "info zef<zefzzefh<f")
        logger.log(type: LogType.ERROR, header: "header", content: "error zef<sg<f")
        logger.log(type: LogType.INFO, header: "header", content: "info zef<zefzzefh<f")
        logger.log(type: LogType.ERROR, header: "header", content: "error zef<sg<f")
        logger.log(type: LogType.INFO, header: "header", content: "info zef<zefzzefh<f")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
