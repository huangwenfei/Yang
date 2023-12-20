//
//  LayoutPriorityValue.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public protocol LayoutPriorityValue {
    var yangPriorityValue: Float { get }
}

extension LayoutPriorityValue {
    public var yangPriorityUIValue: UILayoutPriority {
        .init(rawValue: yangPriorityValue)
    }
}

// MARK: Swift Base
extension LayoutPriorityValue where Self: BinaryInteger {
    public var yangPriorityValue: Float {
        .init(exactly: self) ?? 0
    }
}

extension LayoutPriorityValue where Self: BinaryFloatingPoint {
    public var yangPriorityValue: Float {
        .init(exactly: self) ?? 0
    }
}

extension Int: LayoutPriorityValue { }
extension UInt: LayoutPriorityValue { }
extension Float: LayoutPriorityValue { }
extension Double: LayoutPriorityValue { }
extension CGFloat: LayoutPriorityValue { }

// MARK: UI
extension UILayoutPriority: LayoutPriorityValue {
    public var yangPriorityValue: Float {
        rawValue
    }
}

// MARK: Clamping
@propertyWrapper
public struct LayoutPriorityClamping {
    
    // MARK: Types
    public typealias Value = LayoutPriorityValue
    
    // MARK: Properties
    private var value: Value = LayoutPriority.min
    
    public var wrappedValue: Value {
        get { value }
        set { value = clamp(newValue) }
    }
    
    // MARK: Init
    public init(wrappedValue value: Value) {
        self.value = clamp(value)
    }
    
    private func clamp(_ value: Value) -> Value {
        min(max(LayoutPriority.min, value.yangPriorityValue), LayoutPriority.max)
    }
    
}
