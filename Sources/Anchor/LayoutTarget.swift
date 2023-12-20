//
//  LayoutTarget.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public class LayoutTarget: LayoutTargetProtocol, CustomReflectable {
    
    // MARK: Properties
    public var anchor: LayoutAnchor
    public weak var target: LayoutItem?
    
    internal var toAnchor: LayoutConstraintAnchorTarget {
        .init(anchor: anchor, target: target)
    }
    
    public lazy private(set) var _constraint: LayoutConstraint = .init(
        target: toAnchor,
        related: .none,
        formula: LayoutFormulaRelator.defaultFormula(using: .equal)
    )
    
    public lazy var constraint: LayoutConstraintMaker = .init(constraint: _constraint)
    
    // MARK: Init
    public required init(anchor: LayoutAnchor,  target: LayoutItem?) {
        self.anchor = anchor
        self.target = target
    }
    
    // MARK: CustomReflectable
    internal typealias ReflectableElement = (label: String?, value: Any)
    internal func elements() -> [ReflectableElement] {
        [
            ("anchor", anchor),
            ("target", String(describing: target))
        ]
    }
    
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
    
}
