//
//  LayoutManagerBuild.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import Foundation

public protocol LayoutManagerBuild where Self: LayoutManager { 
    associatedtype Builder: LayoutBuilderBuild
}

extension LayoutManagerBuild {
    
    public typealias Maker = (_ make: Builder) -> Void
    
    public func make(_ maker: Maker) {
        Builder(layoutItem: layoutItem).make(maker)
    }
    
    public func update(_ maker: Maker) {
        Builder(layoutItem: layoutItem).update(maker)
    }
    
    public func replace(_ maker: Maker) {
        Builder(layoutItem: layoutItem).replace(maker)
    }
    
    public func remake(_ maker: Maker) {
        Builder(layoutItem: layoutItem).remake(maker)
    }
    
    public func remove() {
        Builder(layoutItem: layoutItem).remove()
    }
    
}


public protocol LayoutManagerLinkerBuild: LayoutManagerBuild where Builder == LayoutBatchLinkerBuilder { }
