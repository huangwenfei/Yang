//
//  LayoutBuilder.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import Foundation

public protocol LayoutBuilderPortocol {
    var layoutItem: LayoutItem { get }
    init(layoutItem: LayoutItem)
}


public protocol LayoutBuilderConstraints: AnyObject {
    var constraints: [LayoutConstraint] { get set }
}

extension LayoutBuilderConstraints {
    
    internal func diffUpdate(old constraint: LayoutConstraint) {
        
        /// - Tag: Compress
        let compress = LayoutCompressionDict()
        constraints.forEach({
            compress.add(node: $0)
        })
        
        /// - Tag: Find New Constraint
        if let new = compress.find(node: constraint) {
            
            var shouldReactive = false
            
            /// - Tag: Relate
            if new.related != constraint.related {
                constraint.deactive()
                shouldReactive = true
            }
            
            /// - Tag: Multiplier
            let newMultiplier = new.formula.multiplier.yangMultiplierValue
            let oldMultiplier = constraint.formula.multiplier.yangMultiplierValue
            if newMultiplier != oldMultiplier {
                constraint.deactive()
                shouldReactive = true
            }
            
            /// - Tag:  Identifier / Priority / Offset
            if shouldReactive == false {
                constraint.identifier = new.identifier
                constraint.formula.priority = new.formula.priority
                constraint.formula.constant = new.formula.constant
                
                constraint.updateIfCan()
                
                compress.remove(node: constraint)
            }
            
        }
        
        /// - Tag: New Constraints
        constraints = compress.allValues
        
    }
    
}


public protocol LayoutBuilder:
    LayoutBuilderPortocol,
    LayoutBuilderConstraints,
    CustomReflectable
{
    typealias ReflectableElement = (label: String?, value: Any)
    func elements() -> [ReflectableElement]
}

extension LayoutBuilder {
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
}
