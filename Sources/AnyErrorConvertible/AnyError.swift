//
//  AnyError.swift
//  
//
//  Created by Yuya Oka on 2022/08/04.
//

import Foundation

#if swift(>=5.6)
public typealias AnyError = any Error
#else
public typealias AnyError = Error
#endif
