//
//  LayoutContantSizeValue.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation
import CoreGraphics

public protocol LayoutContantSizeValue {
    var yangContantSizeValue: CGSize { get }
}

// MARK: Swift Base
extension LayoutContantSizeValue where Self: BinaryInteger {
    public var yangContantSizeValue: CGSize {
        let result = CGFloat(exactly: self) ?? 0
        return CGSize(width: result, height: result)
    }
}

extension LayoutContantSizeValue where Self: BinaryFloatingPoint {
    public var yangContantSizeValue: CGSize {
        let result = CGFloat(exactly: self) ?? 0
        return CGSize(width: result, height: result)
    }
}

extension Int: LayoutContantSizeValue { }
extension UInt: LayoutContantSizeValue { }
extension Float: LayoutContantSizeValue { }
extension Double: LayoutContantSizeValue { }
extension CGFloat: LayoutContantSizeValue { }

// MARK: CG
extension CGPoint: LayoutContantSizeValue {
    public var yangContantSizeValue: CGSize {
        .init(width: x, height: y)
    }
}

extension CGSize: LayoutContantSizeValue {
    public var yangContantSizeValue: CGSize {
        self
    }
}
