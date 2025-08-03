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

public struct LayoutAnimatorConfiguration: CustomReflectable {
    
    // MARK: Properties
    public var setNeedsUpdateConstraints: Bool
    public weak var animator: UIViewPropertyAnimator!
    
    // MARK: Init
    public init(
        setNeedsUpdateConstraints: Bool = false,
        animator: UIViewPropertyAnimator
    ) {
        
        self.setNeedsUpdateConstraints = setNeedsUpdateConstraints
        self.animator = animator
    }
    
    // MARK: CustomReflectable
    public typealias ReflectableElement = (label: String?, value: Any)
    public func elements() -> [ReflectableElement] {
        [
            ("setNeedsUpdateConstraints", setNeedsUpdateConstraints),
            ("animator", String(describing: animator)),
            ("animator.duration", String(describing: animator?.duration))
        ]
    }
    
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
    
    // MARK: Control
    public func start() {
        animator?.startAnimation()
    }
    
    public func pause() {
        animator?.pauseAnimation()
    }
    
    public func stop() {
        animator?.stopAnimation(true)
    }
    
    public func finish() {
        animator?.finishAnimation(at: .end)
    }
    
    public func progress(_ value: CGFloat) {
        let value = min(max(value, 0), 1)
        pause()
        animator?.fractionComplete = value
    }
    
    public func restart() {
        stop()
        progress(0)
        start()
    }
    
}

