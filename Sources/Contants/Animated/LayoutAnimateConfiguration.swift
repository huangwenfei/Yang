//
//  LayoutAnimateConfiguration.swift
//  Yang
//
//  Created by windy on 2023/12/24.
//

import UIKit

public struct LayoutAnimateConfiguration: CustomReflectable {
    
    // MARK: Properties
    public var setNeedsUpdateConstraints: Bool
    public var duration: TimeInterval
    public var delay: TimeInterval
    public var options: UIView.AnimationOptions
    public var completion: (UIViewAnimatingPosition) -> Void
    
    // MARK: Init
    public init(
        setNeedsUpdateConstraints: Bool = false,
        duration: TimeInterval = 0.25,
        delay: TimeInterval = 0,
        options: UIView.AnimationOptions = .curveEaseIn,
        completion: @escaping (UIViewAnimatingPosition) -> Void = { _ in }
    ) {
        
        self.setNeedsUpdateConstraints = setNeedsUpdateConstraints
        self.duration = duration
        self.delay = delay
        self.options = options
        self.completion = completion
    }
    
    // MARK: CustomReflectable
    public typealias ReflectableElement = (label: String?, value: Any)
    public func elements() -> [ReflectableElement] {
        [
            ("setNeedsUpdateConstraints", setNeedsUpdateConstraints),
            ("duration", duration),
            ("delay", delay),
            ("options", options),
            ("completion", completion)
        ]
    }
    
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
    
}

