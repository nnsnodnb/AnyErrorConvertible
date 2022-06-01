//
//  AnyErrorConvertibleAction+Rx.swift
//  
//
//  Created by Yuya Oka on 2022/06/01.
//

import Action
import AnyErrorConvertible
import Foundation
import RxSwift

public extension Action {
    func anyErrorTranslate<E: AnyErrorConvertible>() -> Observable<E> {
        underlyingError.map { AnyErrorTranslator<E>.translate($0) }
    }
}
