//
//  LayoutBuilderBuild.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import Foundation

public protocol LayoutBuilderBuild where Self: LayoutBuilder { }

extension LayoutBuilderBuild {
    
    public typealias Maker = (_ maker: Self) -> Void
    
    public func make(_ maker: Maker) {
        makeConstraints(maker)
        constraints.forEach({ $0.active() })
    }
    
    public func update(_ maker: Maker) {
        
        let oldConstraints = layoutItem.constraints
        
        guard !oldConstraints.isEmpty else {
            self.make(maker)
            return
        }
        
        makeConstraints(maker)
        
        constraints.forEach({ constraint in
            guard let old = oldConstraints.first(where: {
                $0.anchor == constraint.anchor
            }) else {
                return
            }
            
            old.updateIfCan()
        })
    
    }
    
    public func replace(_ maker: Maker) {
        let oldConstraints = layoutItem.constraints
        
        guard !oldConstraints.isEmpty else {
            self.make(maker)
            return
        }
        
        makeConstraints(maker)
        
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
    
    public func remake(_ maker: Maker) {
        remove()
        make(maker)
    }
    
    public func remove() {
        layoutItem.constraints.forEach({ $0.deactive() })
        constraints = []
    }
    
}

extension LayoutBuilderBuild {
    internal func makeConstraints(_ maker: Maker) {
        maker(self)
        compresion()
    }
}

extension LayoutBuilderBuild {
    
    fileprivate func compresion() {
        let compress = LayoutCompressionDict()
        constraints.forEach({ compress.add(node: $0) })
        constraints = compress.allValues
    }
    
}
