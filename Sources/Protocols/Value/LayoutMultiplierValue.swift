//
//  LayoutMultiplierValue.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import Foundation
import CoreGraphics

public protocol LayoutMultiplierValue {
    var yangMultiplierValue: CGFloat { get }
}

// MARK: Swift Base
extension LayoutMultiplierValue where Self: BinaryInteger {
    public var yangMultiplierValue: CGFloat {
        .init(exactly: self) ?? 1
    }
}

extension LayoutMultiplierValue where Self: BinaryFloatingPoint {
    public var yangMultiplierValue: CGFloat {
        .init(exactly: self) ?? 1
    }
}

extension Int: LayoutMultiplierValue { }
extension UInt: LayoutMultiplierValue { }
extension Float: LayoutMultiplierValue { }
extension Double: LayoutMultiplierValue { }
extension CGFloat: LayoutMultiplierValue { }

// MARK: Clamping
@propertyWrapper
public struct LayoutMultiplierClamping {
    
    // MARK: Types
    public typealias Value = LayoutMultiplierValue
    
    // MARK: Properties
    private var value: Value
    
    public var wrappedValue: Value {
        get { value }
        set { value = newValue.yangMultiplierValue <= 0 ? 1 : newValue }
    }
    
    // MARK: Init
    public init(wrappedValue value: Value) {
        self.value = value.yangMultiplierValue <= 0 ? 1 : value
    }
    
}
