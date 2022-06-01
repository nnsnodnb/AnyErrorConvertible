import Action
import AnyErrorConvertible
@testable import AnyErrorConvertibleAction
import Foundation
import RxSwift
import RxTest
import XCTest

final class AnyErrorConvertibleActionTests: XCTestCase {
    func testExample() {
        let error = NSError(domain: "example error", code: 0)
        let action: Action<Void, Void> = .init { return .error(error) }
        let testScheduler = TestScheduler(initialClock: 0)
        let disposeBag = DisposeBag()
        let observer = testScheduler.createObserver(ExampleError.self)

        action.anyErrorTranslate(ExampleError.self).bind(to: observer).disposed(by: disposeBag)
        testScheduler.advanceTo(1)
        action.execute()

        XCTAssertEqual(observer.events, [.next(1, .a)])
    }
}

// MARK: - ExampleError
private extension AnyErrorConvertibleActionTests {
    enum ExampleError: AnyErrorConvertible {
        case a

        static func make(_ error: Error) -> Self {
            return .a
        }
    }
}
