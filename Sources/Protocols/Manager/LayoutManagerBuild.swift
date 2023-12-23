//
//  LayoutManagerBuild.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import Foundation

public protocol LayoutManagerBuild where Self: LayoutManager { 
    associatedtype Builder: LayoutBuilder
    associatedtype Updater: LayoutBuilder
}

extension LayoutManagerBuild {
    
    public typealias MakeClosure = (_ make: Builder) -> Void
    public typealias UpdatClosure = (_ make: Updater) -> Void
    
    public func make(_ maker: MakeClosure) {
        let constraints = makeConstraints(maker)
        constraints.forEach({ $0.active() })
    }
    
    public func update(_ updater: UpdatClosure) {
        
        let oldConstraints = layoutItem.constraints
        
        guard !oldConstraints.isEmpty else {
            return
        }
        
        let constraints = makeConstraints(updater)
        
        constraints.forEach({ constraint in
            guard let old = oldConstraints.first(where: {
                $0.anchor == constraint.anchor
            }) else {
                return
            }
            
            old.updateIfCan()
        })
    
    }
    
    public func replace(_ maker: MakeClosure) {
        let oldConstraints = layoutItem.constraints
        
        guard !oldConstraints.isEmpty else {
            self.make(maker)
            return
        }
        
        let constraints = makeConstraints(maker)
        
        constraints.forEach({ constraint in
            guard let old = oldConstraints.first(where: {
                $0.anchor == constraint.anchor
            }) else {
                return
            }
            
            LayoutConstraintUpdater.diffUpdate(old: old, new: constraint)
        })
        
        constraints.forEach({ $0.active() })
    }
    
    public func remake(_ maker: MakeClosure) {
        remove()
        make(maker)
    }
    
    public func remove() {
        layoutItem.constraints.forEach({ $0.deactive() })
    }
    
}

extension LayoutManagerBuild {
    internal func makeConstraints(_ maker: MakeClosure) -> [LayoutConstraint] {
        let builder = Builder(layoutItem: layoutItem)
        maker(builder)
        return compresion(builder.constraints)
    }

    internal func makeConstraints(_ updater: UpdatClosure) -> [LayoutConstraint] {
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
