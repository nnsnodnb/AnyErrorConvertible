//
//  AnyErrorConvertible.swift
//
//
//  Created by Yuya Oka on 2022/06/01.
//

import Foundation

public protocol AnyErrorConvertible {
    static func make(_ error: Error) -> Self
}
