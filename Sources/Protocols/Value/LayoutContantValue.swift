//
//  LayoutContantValue.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public protocol LayoutContantValue {
    func yangContantValue(by attribute: LayoutTypes.LayoutConstraintTargetAttribute) -> CGFloat
}

// MARK: Swift Base
extension LayoutContantValue where Self: BinaryInteger {
    public func yangContantValue(by attribute: LayoutTypes.LayoutConstraintTargetAttribute) -> CGFloat {
        .init(exactly: self) ?? 0
    }
}

extension LayoutContantValue where Self: BinaryFloatingPoint {
    public func yangContantValue(by attribute: LayoutTypes.LayoutConstraintTargetAttribute) -> CGFloat {
        .init(exactly: self) ?? 0
    }
}

extension Int: LayoutContantValue { }
extension UInt: LayoutContantValue { }
extension Float: LayoutContantValue { }
extension Double: LayoutContantValue { }
extension CGFloat: LayoutContantValue { }

// MARK: CG Base
extension CGSize: LayoutContantValue {
    public func yangContantValue(by attribute: LayoutTypes.LayoutConstraintTargetAttribute) -> CGFloat {
    
        switch attribute {
        case .left, .right, .top, .bottom,
             .leading, .trailing,
             .centerX, .centerY,
             .lastBaseline, .firstBaseline,
             .leftMargin, .rightMargin, .topMargin, .bottomMargin,
             .leadingMargin, .trailingMargin,
             .centerXWithinMargins, .centerYWithinMargins,
             .notAnAttribute:
            
            return 0
            
        case .width:
            return width
            
        case .height:
            return height
            
        @unknown default:
            return 0
        }
        
    }
}

extension CGPoint: LayoutContantValue {
    public func yangContantValue(by attribute: LayoutTypes.LayoutConstraintTargetAttribute) -> CGFloat {
    
        switch attribute {
        case .left, .right,
             .leading, .trailing,
             .centerX,
             .leftMargin, .rightMargin,
             .leadingMargin, .trailingMargin,
             .centerXWithinMargins:
            
            return x
            
        case .top, .bottom,
             .centerY,
             .lastBaseline, .firstBaseline,
             .topMargin, .bottomMargin,
             .centerYWithinMargins:
            
            return y
            
        case .width, .height, .notAnAttribute:
            return 0
            
        @unknown default:
            return 0
        }
        
    }
}

// MARK: UI/NS Base
extension UIEdgeInsets: LayoutContantValue {
    private var diretion: UIUserInterfaceLayoutDirection {
        UIApplication.shared.userInterfaceLayoutDirection
    }
    
    public func yangContantValue(by attribute: LayoutTypes.LayoutConstraintTargetAttribute) -> CGFloat {
    
        switch attribute {
        case .left, .leftMargin:
            return left
            
        case .right, .rightMargin:
            return -right
            
        case .leading, .leadingMargin:
            switch diretion {
            case .leftToRight:
                return left
            case .rightToLeft:
                return right
            @unknown default:
                return left
            }
            
        case .trailing, .trailingMargin:
            switch diretion {
            case .leftToRight:
                return -right
            case .rightToLeft:
                return -left
            @unknown default:
                return -left
            }
        
        case .centerX, .centerXWithinMargins:
            return (left - right) * 0.5
            
        case .top, .topMargin, .firstBaseline:
            return top
            
        case .bottom, .bottomMargin, .lastBaseline:
            return -bottom
            
        case .centerY, .centerYWithinMargins:
            return (top - bottom) * 0.5
            
        case .width:
            return -(left + right)
            
        case .height:
            return -(top + bottom)
            
        case .notAnAttribute:
            return 0
            
        @unknown default:
            return 0
        }
        
    }
}
