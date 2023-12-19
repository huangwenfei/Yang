//
//  LayoutContantPointValue.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation
import CoreGraphics

public protocol LayoutContantPointValue {
    var yangContantPointValue: CGPoint { get }
}

// MARK: Swift Base
extension LayoutContantPointValue where Self: BinaryInteger {
    public var yangContantPointValue: CGPoint {
        let result = CGFloat(exactly: self) ?? 0
        return CGPoint(x: result, y: result)
    }
}

extension LayoutContantPointValue where Self: BinaryFloatingPoint {
    public var yangContantPointValue: CGPoint {
        let result = CGFloat(exactly: self) ?? 0
        return CGPoint(x: result, y: result)
    }
}

extension Int: LayoutContantPointValue { }
extension UInt: LayoutContantPointValue { }
extension Float: LayoutContantPointValue { }
extension Double: LayoutContantPointValue { }
extension CGFloat: LayoutContantPointValue { }

// MARK: CG
extension CGPoint: LayoutContantPointValue {
    public var yangContantPointValue: CGPoint {
        self
    }
}

extension CGSize: LayoutContantPointValue {
    public var yangContantPointValue: CGPoint {
        .init(x: width, y: height)
    }
}
