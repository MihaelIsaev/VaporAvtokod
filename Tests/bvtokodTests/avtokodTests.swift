import XCTest
@testable import avtokod

final class avtokodTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(avtokod().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
