//
//  LayoutCompressionDict.swift
//  Yang
//
//  Created by windy on 2023/12/21.
//

import Foundation

public final class LayoutCompressionDict {
    
    // MARK: Types
    public typealias Key = LayoutAnchor.RawValue
    public typealias Value = LayoutConstraint
    public typealias Raw = Dictionary<Key, Value>
    
    // MARK: Properties
    public var value: Raw
    
    public var allValues: [Value] {
        value.map({ $0.value })
    }
    
    // MARK: Init
    public init(value: Raw = [:]) {
        self.value = value
    }
    
    // MARK: CURD
    public func add(node: Value) {
        let anchorKey = node.anchor.rawValue
        value[anchorKey] = node
    }
    
    @discardableResult
    public func remove(node: Value) -> Value? {
        let anchorKey = node.anchor.rawValue
        let remove = value[anchorKey]
        value[anchorKey] = nil
        return remove
    }
    
    public func find(node: Value) -> Value? {
        let anchorKey = node.anchor.rawValue
        return value[anchorKey]
    }
    
}
