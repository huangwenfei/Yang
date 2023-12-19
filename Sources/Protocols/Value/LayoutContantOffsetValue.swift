//
//  LayoutContantOffsetValue.swift
//  WakeUI
//
//  Created by windy on 2023/12/17.
//

import Foundation

public protocol LayoutContantOffsetValue {
    var yangContantOffsetValue: CGFloat { get }
}

// MARK: Swift Base
extension LayoutContantOffsetValue where Self: BinaryInteger {
    public var yangContantOffsetValue: CGFloat {
        .init(exactly: self) ?? 0
    }
}

extension LayoutContantOffsetValue where Self: BinaryFloatingPoint {
    public var yangContantOffsetValue: CGFloat {
        .init(exactly: self) ?? 0
    }
}

extension Int: LayoutContantOffsetValue { }
extension UInt: LayoutContantOffsetValue { }
extension Float: LayoutContantOffsetValue { }
extension Double: LayoutContantOffsetValue { }
extension CGFloat: LayoutContantOffsetValue { }
