//
//  LayoutPriority.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public struct LayoutPriority: Hashable, RawRepresentable {
    
    // MARK: Types
    public typealias SystemType = UILayoutPriority
    public typealias RawValue = SystemType.RawValue
    
    // MARK: Properties
    public var rawValue: RawValue
    
    // MARK: Init
    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    
    // MARK: Values
    /// UILayoutPriority.required == 1000
    public static var normal: Self = .init(
        rawValue: UILayoutPriority.required.rawValue
    )
    
    /// UILayoutPriority.defaultHigh == 750
    public static var high: Self = .init(
        rawValue: UILayoutPriority.defaultHigh.rawValue
    )
    
    /// 500
    public static var middle: Self = .init(
        rawValue: 500
    )
    
    /// UILayoutPriority.defaultLow == 250
    public static var low: Self = .init(
        rawValue: UILayoutPriority.defaultLow.rawValue
    )
    
    // MARK: Related
    public var systemPriority: SystemType {
        .init(rawValue: rawValue)
    }
    
}

extension LayoutPriority: LayoutPriorityValue {
    public var yangPriorityValue: Float {
        rawValue
    }
}
