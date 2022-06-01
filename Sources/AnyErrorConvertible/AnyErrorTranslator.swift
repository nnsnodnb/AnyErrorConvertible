//
//  AnyErrorTranslator.swift
//  
//
//  Created by Yuya Oka on 2022/06/01.
//

import Foundation

public struct AnyErrorTranslator<E: AnyErrorConvertible> {
    public static func translate(_ error: Error) -> E {
        return E.make(error)
    }
}
