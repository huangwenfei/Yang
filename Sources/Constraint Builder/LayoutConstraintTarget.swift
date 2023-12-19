//
//  LayoutConstraintTarget.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

internal final class LayoutConstraintTarget: CustomReflectable {
    
    // MARK: Properties
    internal var attribute: LayoutAnchor.Attribute
    internal weak var target: LayoutItem?
    
    // MARK: Init
    internal init(attribute: LayoutAnchor.Attribute,  target: LayoutItem?) {
        self.attribute = attribute
        self.target = target
    }
    
    // MARK: CustomReflectable
    internal typealias ReflectableElement = (label: String?, value: Any)
    internal func elements() -> [ReflectableElement] {
        [
            ("attribute", attribute),
            ("target", String(describing: target))
        ]
    }
    
    internal var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
    
}
