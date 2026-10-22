@testable import AnyErrorConvertible
import Foundation
import Testing

struct AnyErrorConvertibleTests {
    @Test
    func testExampleErrorCaseA() {
        let error = NSError(domain: "example error", code: 0)

        #expect(AnyErrorTranslator<ExampleError>.translate(error) == .a)
    }

    @Test
    func testExampleErrorCaseB() {
        let error = NSError(domain: "example error", code: 999)

        #expect(AnyErrorTranslator<ExampleError>.translate(error) == .b)
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
