//
//  LayoutStateCache.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import UIKit

public final class LayoutStateCache: CustomReflectable {
    
    // MARK: Properties
    public var autoresizingMask: Bool
    
    // MARK: Init
    public init(autoresizingMask: Bool = true) {
        self.autoresizingMask = autoresizingMask
    }
    
    // MARK: CustomReflectable
    public typealias ReflectableElement = (label: String?, value: Any)
    public func elements() -> [ReflectableElement] {
        [
            ("autoresizingMask", autoresizingMask)
        ]
    }
    
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
    
}
