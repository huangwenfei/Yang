//
//  LayoutConstraintAnchorTarget.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import UIKit

internal final class LayoutConstraintAnchorTarget: CustomReflectable {
    
    // MARK: Properties
    internal var anchor: LayoutAnchor
    internal weak var target: LayoutItem?
    
    internal static var none: LayoutConstraintAnchorTarget {
        .init(anchor: .none, target: nil)
    }
    
    // MARK: Init
    internal init(anchor: LayoutAnchor,  target: LayoutItem?) {
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
    
    internal var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
    
    // MARK: Copy
    internal func copy() -> LayoutConstraintAnchorTarget {
        .init(anchor: anchor, target: target)
    }
    
}
