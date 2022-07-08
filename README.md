# AnyErrorConvertible

Help convert Error to any type.

## Usage

This framework has `AnyErrorConvertible` protocol and `AnyErrorTranslator` struct.

You can implement your own error conversion logic.

### Core Usecase

For example, the following code.

```swift
import AnyErrorConvertible

enum ConnectionError: AnyErrorConvertible {
    case notFound
    case internal
    case unknown

    static func make(_ error: Error) -> Self {
        // Please your logic.
    }
}

let error = ... // This error is `Swift.Error` type which is from URLSession, CoreData and so on.
let connectionError = AnyErrorTranslator<ConnectionError>.translate(error)
switch connectionError {
case .notFound:
    print("Connection not found.")
case .internal:
    print("Occurred internal error")
case .unknown:
    print("Unknown error")
}
```

### [*RxSwiftCommunity/Action*](https://github.com/RxSwiftCommunity/Action) Usecase

```swift
import Action
import AnyErrorConvertible
#if SWIFT_PACKAGE
import AnyErrorConvertibleAction
#endif
import RxSwift

let action: Action<Void, Void> = .init { /* Any observable */ }
_ = action.anyErrorTranslate<ConnectionError.self>
    .subscribe(onNext: { connectionError in
        switch connectionError {
        case .notFound:
            print("Connection not found.")
        case .internal:
            print("Occurred internal error")
        case .unknown:
            print("Unknown error")
        }
    })
action.execute()
```

## Installation

### Swift Package Manager

**Use Xcode**

`Open File` > `Swift Packages` > `Add Package Dependency...` and put Repository URL.  
`https://github.com/nnsnodnb/AnyErrorConvertible`. This [document](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) will also help you.

**Use Package.swift**

Add the following to your `Package.swift` file dependencies:

```swift
.package(url: "https://github.com/nnsnodnb/AnyErrorConvertible.swift", from: "1.0.0")
```

### CocoaPods

Add the following to your `Podfile` file.

```ruby
pod 'AnyErrorConvertible', '~> 1.0.0'
pod 'AnyErrorConvertible/Action', '~> 1.0.0' # If using RxSwift.
```

And please execute `pod install`.

## License

AnyErrorConvertible is released under the MIT License. See [LICENSE](LICENSE) for details.
