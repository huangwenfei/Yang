//
//  LayoutAnchor.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public struct LayoutAnchor: OptionSet, CustomReflectable {
    
    // MARK: Types
    public typealias Attribute = LayoutTypes.LayoutConstraintTargetAttribute
    public typealias RawValue = UInt
    
    // MARK: Properties
    public var rawValue: RawValue
    
    public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
    
    // MARK: Static Properties
    public static let none: Self = .init(rawValue: 1 << 0)
    
    public static let left: Self = .init(rawValue: UInt(1) << 1)
    public static let right: Self = .init(rawValue: UInt(1) << 2)
    public static let top: Self = .init(rawValue: UInt(1) << 3)
    public static let bottom: Self = .init(rawValue: UInt(1) << 4)
    
    public static let centerX: Self = .init(rawValue: UInt(1) << 5)
    public static let centerY: Self = .init(rawValue: UInt(1) << 6)
    
    public static let leading: Self = .init(rawValue: UInt(1) << 7)
    public static let trailing: Self = .init(rawValue: UInt(1) << 8)
    
    public static let width: Self = .init(rawValue: UInt(1) << 9)
    public static let height: Self = .init(rawValue: UInt(1) << 10)
    
    public static let leftMargin: Self = .init(rawValue: UInt(1) << 11)
    public static let rightMargin: Self = .init(rawValue: UInt(1) << 12)
    public static let topMargin: Self = .init(rawValue: UInt(1) << 13)
    public static let bottomMargin: Self = .init(rawValue: UInt(1) << 14)
    
    public static let centerXMargin: Self = .init(rawValue: UInt(1) << 15)
    public static let centerYMargin: Self = .init(rawValue: UInt(1) << 16)
    
    public static let leadingMargin: Self = .init(rawValue: UInt(1) << 17)
    public static let trailingMargin: Self = .init(rawValue: UInt(1) << 18)
    
    public static let firstBaseline: Self = .init(rawValue: UInt(1) << 19)
    public static let lastBaseline: Self = .init(rawValue: UInt(1) << 20)
    
    
    public static let horizontal: Self = [.left, .right]
    public static let vertical: Self = [.top, .bottom]
    
    public static let diretionHorizontal: Self = [.leading, .trailing]
    public static let diretionVertical: Self = [.top, .bottom]
    
    public static let horizontalMargins: Self = [.leftMargin, .rightMargin]
    public static let verticalMargins: Self = [.topMargin, .bottomMargin]
    
    public static let diretionHorizontalMargins: Self = [.leadingMargin, .trailingMargin]
    public static let diretionVerticalMargins: Self = [.topMargin, .bottomMargin]
    
    
    public static let center: Self = [.centerX, .centerY]
    public static let edge: Self = [.left, .right, .top, .bottom]
    public static let diretionEdge: Self = [.leading, .trailing, .top, .bottom]
    
    public static let centerMargins: Self = [
        .centerXMargin, .centerYMargin
    ]
    
    public static let edgeMargins: Self = [
        .leftMargin, .rightMargin, .topMargin, .bottomMargin
    ]
    
    public static let diretionEdgeMargins: Self = [
        .leadingMargin, .trailingMargin, .topMargin, .bottomMargin
    ]
    
    public static let size: Self = [.width, .height]
    
    // MARK: Special
    public var isEmpty: Bool { attributes == [] }
    
    public var isPosition: Bool {
        !self.contains(.width) && !self.contains(.height)
    }
    
    public var isPositionX: Bool {
        switch self {
        case .left, .right,
             .centerX,
             .leading, .trailing,
             .leftMargin, .rightMargin,
             .centerXMargin,
             .leadingMargin, .trailingMargin:
            
            return true
            
        default:
            return false
        }
    }
    
    public var isPositionY: Bool {
        switch self {
        case .top, .bottom,
             .centerY,
             .topMargin, .bottomMargin,
             .centerYMargin,
             .firstBaseline, .lastBaseline:
            
            return true
            
        default:
            return false
        }
    }
    
    public var isSize: Bool {
        self == .width || self == .height || self == .size
    }
    
    // MARK: Layout Attributes
    public var attributes: [Attribute] {
        var result: [Attribute] = []
        if contains(.none) { result.append(.notAnAttribute) }
        if contains(.left) { result.append(.left) }
        if contains(.right) { result.append(.right) }
        if contains(.top) { result.append(.top) }
        if contains(.bottom) { result.append(.bottom) }
        if contains(.centerX) { result.append(.centerX) }
        if contains(.centerY) { result.append(.centerY) }
        if contains(.leading) { result.append(.leading) }
        if contains(.trailing) { result.append(.trailing) }
        if contains(.width) { result.append(.width) }
        if contains(.height) { result.append(.height) }
        if contains(.firstBaseline) { result.append(.firstBaseline) }
        if contains(.lastBaseline) { result.append(.lastBaseline) }
        if contains(.leftMargin) { result.append(.leftMargin) }
        if contains(.rightMargin) { result.append(.rightMargin) }
        if contains(.topMargin) { result.append(.topMargin) }
        if contains(.bottomMargin) { result.append(.bottomMargin) }
        if contains(.centerXMargin) { result.append(.centerXWithinMargins) }
        if contains(.centerYMargin) { result.append(.centerYWithinMargins) }
        if contains(.leadingMargin) { result.append(.leadingMargin) }
        if contains(.trailingMargin) { result.append(.trailingMargin) }
        return result
    }
    
    public var attributeCompression: Set<String> {
        var result: Set<String> = []
        if contains(.none) { result.insert("notAnAttribute") }
        if contains(.left) { result.insert("left") }
        if contains(.right) { result.insert("right") }
        if contains(.top) { result.insert("top") }
        if contains(.bottom) { result.insert("bottom") }
        if contains(.centerX) { result.insert("centerX") }
        if contains(.centerY) { result.insert("centerY") }
        if contains(.leading) { result.insert("leading") }
        if contains(.trailing) { result.insert("trailing") }
        if contains(.width) { result.insert("width") }
        if contains(.height) { result.insert("height") }
        if contains(.firstBaseline) { result.insert("firstBaseline") }
        if contains(.lastBaseline) { result.insert("lastBaseline") }
        if contains(.leftMargin) { result.insert("left") }
        if contains(.rightMargin) { result.insert("right") }
        if contains(.topMargin) { result.insert("top") }
        if contains(.bottomMargin) { result.insert("bottom") }
        if contains(.centerXMargin) { result.insert("centerX") }
        if contains(.centerYMargin) { result.insert("centerY") }
        if contains(.leadingMargin) { result.insert("leading") }
        if contains(.trailingMargin) { result.insert("trailing") }
        return result
    }
    
    // MARK: CustomReflectable
    internal var name: String {
        var result: [String] = []
        if contains(.none) { result.append("notAnAttribute") }
        if contains(.left) { result.append("left") }
        if contains(.right) { result.append("right") }
        if contains(.top) { result.append("top") }
        if contains(.bottom) { result.append("bottom") }
        if contains(.centerX) { result.append("centerX") }
        if contains(.centerY) { result.append("centerY") }
        if contains(.leading) { result.append("leading") }
        if contains(.trailing) { result.append("trailing") }
        if contains(.width) { result.append("width") }
        if contains(.height) { result.append("height") }
        if contains(.firstBaseline) { result.append("firstBaseline") }
        if contains(.lastBaseline) { result.append("lastBaseline") }
        if contains(.leftMargin) { result.append("leftMargin") }
        if contains(.rightMargin) { result.append("rightMargin") }
        if contains(.topMargin) { result.append("topMargin") }
        if contains(.bottomMargin) { result.append("bottomMargin") }
        if contains(.centerXMargin) { result.append("centerXMargin") }
        if contains(.centerYMargin) { result.append("centerYMargin") }
        if contains(.leadingMargin) { result.append("leadingMargin") }
        if contains(.trailingMargin) { result.append("trailingMargin") }
        return result.joined(separator: "-")
    }
    
    internal typealias ReflectableElement = (label: String?, value: Any)
    internal func elements() -> [ReflectableElement] {
        [
            ("rawValue", rawValue),
            ("name", name)
        ]
    }
    
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
    
}

public enum LayoutAnchorPositionX: UInt {
    case left, right,
         centerX,
         leading, trailing 
    case leftMargin, rightMargin,
         centerXMargin,
         leadingMargin, trailingMargin
    
    public var anchor: LayoutAnchor {
        switch self {
        case .left:           return .left
        case .right:          return .right
        case .centerX:        return .centerX
        case .leading:        return .leading
        case .trailing:       return .trailing
        case .leftMargin:     return .leftMargin
        case .rightMargin:    return .rightMargin
        case .centerXMargin:  return .centerXMargin
        case .leadingMargin:  return .leadingMargin
        case .trailingMargin: return .trailingMargin
        }
    }
}

public enum LayoutAnchorPositionY: UInt {
    case top, bottom,
         centerY
    case topMargin, bottomMargin,
         centerYMargin
    case firstBaseline, lastBaseline
    
    public var anchor: LayoutAnchor {
        switch self {
        case .top:            return .top
        case .bottom:         return .bottom
        case .centerY:        return .centerY
        case .topMargin:      return .topMargin
        case .bottomMargin:   return .bottomMargin
        case .centerYMargin:  return .centerYMargin
        case .firstBaseline:  return .firstBaseline
        case .lastBaseline:   return .lastBaseline
        }
    }
}

public enum LayoutAnchorPositionHorizontal: UInt {
    case horizontal, diretionHorizontal
    case horizontalMargins, diretionHorizontalMargins
    
    public var anchor: LayoutAnchor {
        switch self {
        case .horizontal:                return .horizontal
        case .diretionHorizontal:        return .diretionHorizontal
        case .horizontalMargins:         return .horizontalMargins
        case .diretionHorizontalMargins: return .diretionHorizontalMargins
        }
    }
}

public enum LayoutAnchorPositionVertical: UInt {
    case vertical, diretionVertical
    case verticalMargins, diretionVerticalMargins
    
    public var anchor: LayoutAnchor {
        switch self {
        case .vertical:                return .vertical
        case .diretionVertical:        return .diretionVertical
        case .verticalMargins:         return .verticalMargins
        case .diretionVerticalMargins: return .diretionVerticalMargins
        }
    }
}

public enum LayoutAnchorPositionEdge: UInt {
    case edge, edgeMargins
    
    public var anchor: LayoutAnchor {
        switch self {
        case .edge:          return .edge
        case .edgeMargins:   return .edgeMargins
        }
    }
}

public enum LayoutAnchorPositionCenter: UInt {
    case center, centerMargins
    
    public var anchor: LayoutAnchor {
        switch self {
        case .center:        return .center
        case .centerMargins: return .centerMargins
        }
    }
}

public enum LayoutAnchorSize: UInt {
    case width, height
    
    public var anchor: LayoutAnchor {
        switch self {
        case .width:  return .width
        case .height: return .height
        }
    }
}

public enum LayoutAnchorSizeList: UInt {
    case size
    
    public var anchor: LayoutAnchor {
        switch self {
        case .size: return .size
        }
    }
}

internal func + (left: LayoutAnchor, right: LayoutAnchor) -> LayoutAnchor {
    left.union(right)
}

internal func += (left: inout LayoutAnchor, right: LayoutAnchor) {
    left.formUnion(right)
}

internal func -= (left: inout LayoutAnchor, right: LayoutAnchor) {
    left.subtract(right)
}
