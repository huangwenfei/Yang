//
//  LayoutIdentifierValue.swift
//  WakeUI
//
//  Created by windy on 2023/12/17.
//

import Foundation
import CoreGraphics

public protocol LayoutIdentifierValue {
    var yangIdentifierValue: String { get }
}

// MARK: Swift Base
extension LayoutIdentifierValue where Self: BinaryInteger {
    public var yangIdentifierValue: String {
        "Integer \(self)"
    }
}

extension LayoutIdentifierValue where Self: BinaryFloatingPoint {
    public var yangIdentifierValue: String {
       "Floating \(self)"
    }
}

extension Int: LayoutIdentifierValue { }
extension UInt: LayoutIdentifierValue { }
extension Float: LayoutIdentifierValue { }
extension Double: LayoutIdentifierValue { }
extension CGFloat: LayoutIdentifierValue { }

extension String: LayoutIdentifierValue {
    public var yangIdentifierValue: String {
        "String \(self)"
    }
}

extension Substring: LayoutIdentifierValue {
    public var yangIdentifierValue: String {
        "String \(self)"
    }
}

extension Character: LayoutIdentifierValue {
    public var yangIdentifierValue: String {
        "String \(self)"
    }
}


