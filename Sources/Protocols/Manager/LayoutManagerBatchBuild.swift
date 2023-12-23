//
//  LayoutManagerBatchBuild.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

public protocol LayoutManagerBatchBuild where Self: LayoutManager {
    
    associatedtype TargetBuilder: LayoutBuilder
    associatedtype LinkerBuilder: LayoutBuilder
    
    associatedtype TargetUpdater: LayoutBuilder
    associatedtype LinkerUpdater: LayoutBuilder
    
}

extension LayoutManagerBatchBuild {
    
    public typealias MakeClosure = (_ make: TargetBuilder, _ linkmake: LinkerBuilder) -> Void
    public typealias UpdateClosure = (_ make: TargetUpdater, _ linkmake: LinkerUpdater) -> Void
    
    public func make(_ maker: MakeClosure) {
        let constraints = makeConstraints(maker)
        constraints.forEach({ $0.active() })
    }
    
    public func update(_ updater: UpdateClosure) {
        
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

extension LayoutManagerBatchBuild {
    
    fileprivate func makeConstraints(_ maker: MakeClosure) -> [LayoutConstraint] {
        let target = TargetBuilder(layoutItem: layoutItem)
        let linker = LinkerBuilder(layoutItem: layoutItem)
        maker(target, linker)
        return compresion(target: target, linker: linker)
    }
    
    fileprivate func makeConstraints(_ maker: UpdateClosure) -> [LayoutConstraint] {
        let target = TargetUpdater(layoutItem: layoutItem)
        let linker = LinkerUpdater(layoutItem: layoutItem)
        maker(target, linker)
        return compresion(target: target, linker: linker)
    }
    
    fileprivate func compresion(target: LayoutBuilderConstraints, linker: LayoutBuilderConstraints) -> [LayoutConstraint] {
        let compress = LayoutCompressionDict()
        target.constraints.forEach({ compress.add(node: $0) })
        linker.constraints.forEach({ compress.add(node: $0) })
        return compress.allValues
    }

}
