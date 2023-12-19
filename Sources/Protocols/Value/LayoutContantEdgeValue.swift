//
//  LayoutContantEdgeValue.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation
import UIKit

public protocol LayoutContantEdgeValue {
    var yangContantEdgeValue: UIEdgeInsets { get }
}

// MARK: Swift Base
extension LayoutContantEdgeValue where Self: BinaryInteger {
    public var yangContantEdgeValue: UIEdgeInsets {
        let result = CGFloat(exactly: self) ?? 0
        return .init(top: result, left: result, bottom: result, right: result)
    }
}

extension LayoutContantEdgeValue where Self: BinaryFloatingPoint {
    public var yangContantEdgeValue: UIEdgeInsets {
        let result = CGFloat(exactly: self) ?? 0
        return .init(top: result, left: result, bottom: result, right: result)
    }
}

extension Int: LayoutContantEdgeValue { }
extension UInt: LayoutContantEdgeValue { }
extension Float: LayoutContantEdgeValue { }
extension Double: LayoutContantEdgeValue { }
extension CGFloat: LayoutContantEdgeValue { }

// MARK: CG
extension CGPoint: LayoutContantEdgeValue {
    public var yangContantEdgeValue: UIEdgeInsets {
        .init(top: y, left: x, bottom: y, right: x)
    }
}

extension CGSize: LayoutContantEdgeValue {
    public var yangContantEdgeValue: UIEdgeInsets {
        .init(top: height, left: width, bottom: height, right: width)
    }
}

// MARK: UI
extension UIEdgeInsets: LayoutContantEdgeValue {
    public var yangContantEdgeValue: UIEdgeInsets {
        self
    }
}
