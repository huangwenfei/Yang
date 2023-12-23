//
//  LayoutTargetUnrelation.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

public class LayoutTargetUnrelation<Maker: LayoutConstraintProtocol>: LayoutTargetProtocol, LayoutConstraintProtocol, CustomReflectable {
    
    // MARK: Properties
    internal var toAnchor: LayoutConstraintAnchorTarget {
        .init(anchor: anchor, target: target)
    }
    
    public private(set) var maker: Maker
    
    public var constraint: LayoutConstraint {
        maker.constraint
    }
    
    // MARK: Init
    public required init(maker: Maker) {
        self.maker = maker
    }
    
    public required init(constraint: LayoutConstraint) {
        self.maker = Maker(constraint: constraint)
    }
    
    // MARK: CustomReflectable
    public func elements() -> [ReflectableElement] {
        [
            ("anchor", anchor),
            ("target", String(describing: target))
        ]
    }
    
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
    
}

extension LayoutTargetUnrelation {
    
    public var anchor: LayoutAnchor {
        get { maker.constraint.anchor }
        set { maker.constraint.anchor = newValue }
    }
    
    public var target: LayoutItem? {
        get { maker.constraint.target }
        set { maker.constraint.target = newValue }
    }
    
}
