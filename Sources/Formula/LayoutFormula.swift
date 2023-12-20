//
//  LayoutFormula.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public struct LayoutFormula: CustomReflectable {
    
    // MARK: Properties
    public var relation: LayoutRelation
    @LayoutMultiplierClamping public var multiplier: LayoutMultiplierValue
    public var constant: LayoutContantValue
    @LayoutPriorityClamping public var priority: LayoutPriorityValue
    
    // MARK: Init
    public init(
        relation: LayoutRelation,
        multiplier: LayoutMultiplierValue,
        constant: LayoutContantValue,
        priority: LayoutPriorityValue
    ) {
        self.relation = relation
        self.multiplier = multiplier
        self.constant = constant
        self.priority = priority
    }
    
    // MARK: CustomReflectable
    public typealias ReflectableElement = (label: String?, value: Any)
    public var elements: [ReflectableElement] {
        [
            ("relation", relation),
            ("multiplier", multiplier),
            ("constant", constant),
            ("priority", priority)
        ]
    }
    
    public var customMirror: Mirror {
        .init(self, children: elements, displayStyle: .class)
    }
    
}
