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
    
    public func make(_ maker: (_ maker: Builder) -> Void) {
        Builder(layoutItem: layoutItem).make(maker)
    }
    
    public func update(_ maker: (_ maker: Builder) -> Void) {
        Builder(layoutItem: layoutItem).update(maker)
    }
    
    public func remake(_ maker: (_ maker: Builder) -> Void) {
        Builder(layoutItem: layoutItem).remake(maker)
    }
    
    public func remove() {
        Builder(layoutItem: layoutItem).remove()
    }
    
}
