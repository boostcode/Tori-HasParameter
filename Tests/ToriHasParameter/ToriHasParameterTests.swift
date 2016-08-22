import XCTest
@testable import ToriHasParameter

class ToriHasParameterTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(ToriHasParameter().text, "Hello, World!")
    }


    static var allTests : [(String, (ToriHasParameterTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
