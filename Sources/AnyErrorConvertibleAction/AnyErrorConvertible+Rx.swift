//
//  AnyErrorConvertibleAction+Rx.swift
//  
//
//  Created by Yuya Oka on 2022/06/01.
//

import Action
#if SWIFT_PACKAGE
import AnyErrorConvertible
#endif
import Foundation
import RxSwift

public extension Action {
    func anyErrorTranslate<E: AnyErrorConvertible>(_: E.Type) -> Observable<E> {
        underlyingError.map { AnyErrorTranslator<E>.translate($0) }
    }
}
