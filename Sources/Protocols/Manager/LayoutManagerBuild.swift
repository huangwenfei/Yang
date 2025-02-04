//
//  LayoutManagerBuild.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import UIKit

public protocol LayoutManagerBuild where Self: LayoutManager { 
    associatedtype Builder: LayoutBuilder
    associatedtype Updater: LayoutBuilder
}

extension LayoutManagerBuild {
    
    public typealias MakeClosure = (_ make: Builder) -> Void
    public typealias UpdateClosure = (_ make: Updater) -> Void
    
    public func make(_ maker: MakeClosure) {
        let constraints = makeConstraints(maker)
        constraints.forEach({ $0.active() })
    }
    
    @discardableResult
    public func update(_ updater: UpdateClosure) -> Bool {
        
        let oldConstraints = layoutItem.constraints
        
        guard !oldConstraints.isEmpty else {
            return false
        }
        
        let constraints = makeConstraints(updater)
        
        constraints.forEach({ constraint in
            guard let old = oldConstraints.first(where: {
                $0.anchor == constraint.anchor
            }) else {
                return
            }
            
            old.updateIfCan(by: constraint)
        })
        
        return true
    
    }
    
    @discardableResult
    public func replace(_ maker: MakeClosure) -> Bool {
        let oldConstraints = layoutItem.constraints
        
        guard !oldConstraints.isEmpty else {
            self.make(maker)
            return false
        }
        
        let constraints = makeConstraints(maker)
        
        var shouldActives = [Bool]()
        
        constraints.forEach({ constraint in
            guard let old = oldConstraints.first(where: {
                $0.anchor == constraint.anchor
            }) else {
                return
            }
            
            let shouldActive = LayoutConstraintUpdater.replaceIfCan(
                old: old, new: constraint
            )
            shouldActives.append(shouldActive)
        })
        
        zip(shouldActives, constraints).forEach({
            if $0 { $1.active() }
        })
        
        return true
    }
    
    public func remake(_ maker: MakeClosure) {
        remove()
        make(maker)
    }
    
    public func remove() {
        removeConstraints()
    }
    
}

extension LayoutManagerBuild {
    public func updateAnimate(_ updater: UpdateClosure, animateConfigs configs: LayoutAnimateConfiguration, isAnimated: Bool) {
        
        guard self.update(updater) else { return }
        
        if isAnimated {
            LayoutConstraintUpdater.animate(layoutItem, with: configs)
        }
    
    }
    
    public func replaceAnimate(_ maker: MakeClosure, animateConfigs configs: LayoutAnimateConfiguration, isAnimated: Bool) {
        
        guard self.replace(maker) else { return }
        
        if isAnimated {
            LayoutConstraintUpdater.animate(layoutItem, with: configs)
        }
    
    }
}

extension LayoutManagerBuild {
    internal func makeConstraints(_ maker: MakeClosure) -> [LayoutConstraint] {
        let builder = Builder(layoutItem: layoutItem)
        maker(builder)
        return compresion(builder.constraints)
    }

    internal func makeConstraints(_ updater: UpdateClosure) -> [LayoutConstraint] {
        let builder = Updater(layoutItem: layoutItem)
        updater(builder)
        return compresion(builder.constraints)
    }
    
    fileprivate func compresion(_ constraints: [LayoutConstraint]) -> [LayoutConstraint] {
        let compress = LayoutCompressionDict()
        constraints.forEach({ compress.add(node: $0) })
        return compress.allValues
    }
    
}
