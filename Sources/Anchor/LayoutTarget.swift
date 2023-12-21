//
//  LayoutTarget.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public class LayoutTargetType<Maker: LayoutConstraintProtocol>: LayoutTargetProtocol, CustomReflectable {
    
    // MARK: Properties
    internal var toAnchor: LayoutConstraintAnchorTarget {
        .init(anchor: anchor, target: target)
    }
    
    public private(set) var maker: Maker
    
    // MARK: Init
    public required init(maker: Maker) {
        self.maker = maker
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
