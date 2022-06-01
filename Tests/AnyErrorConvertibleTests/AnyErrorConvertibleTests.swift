@testable import AnyErrorConvertible
import XCTest

final class AnyErrorConvertibleTests: XCTestCase {
    func testExampleErrorCaseA() {
        let error = NSError(domain: "example error", code: 0)

        XCTAssertEqual(AnyErrorTranslator<ExampleError>.translate(error), .a)
    }

    func testExampleErrorCaseB() {
        let error = NSError(domain: "example error", code: 999)

        XCTAssertEqual(AnyErrorTranslator<ExampleError>.translate(error), .b)
    }
}

// MARK: - ExampleError
private extension AnyErrorConvertibleTests {
    enum ExampleError: AnyErrorConvertible {
        case a
        case b

        static func make(_ error: Error) -> AnyErrorConvertibleTests.ExampleError {
            switch error._code {
            case 0:
                return .a
            default:
                return .b
            }
        }
    }
}
