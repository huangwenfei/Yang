//
//  LayoutBatchListManager.swift
//  Yang
//
//  Created by windy on 2024/3/8.
//

import Foundation

public final class LayoutBatchListManager<Collection> where Collection: Swift.Collection, Collection.Element: LayoutItem {
    
    // MARK: Properties
    public var collection: Collection
    
    // MARK: Init
    public init(collection: Collection) {
        self.collection = collection
    }
    
    // MARK: Methods
    public typealias Builder = LayoutBatchLinkerBuilder
    public typealias Updater = LayoutBatchLinkUpdater
    
    public typealias MakeClosure = (_ index: Int, _ item: Collection.Element, _ make: Builder) -> Void
    public typealias UpdateClosure = (_ index: Int, _ item: Collection.Element, _ make: Updater) -> Void
    
    public func make(_ maker: MakeClosure) {
        for (index, layoutItem) in collection.enumerated() {
            let constraints = makeConstraints(with: layoutItem, in: index, maker)
            constraints.forEach({ $0.active() })
        }
    }
    
    public struct ModifierInfo {
        public let index: Int
        public let item: Collection.Element
        public let result: Bool
        
        public init(index: Int, item: Collection.Element, result: Bool) {
            self.index = index
            self.item = item
            self.result = result
        }
    }
    
    @discardableResult
    public func update(_ updater: UpdateClosure) -> [ModifierInfo] {
        
        var result: [ModifierInfo] = []
        
        for (index, layoutItem) in collection.enumerated() {
            
            guard self.update(index: index, layoutItem: layoutItem, updater) else {
                result.append(.init(index: index, item: layoutItem, result: false))
                continue
            }
            
            result.append(.init(index: index, item: layoutItem, result: true))
            
        }
        
        return result
    
    }
    
    @discardableResult
    public func replace(_ maker: MakeClosure) -> [ModifierInfo] {
        
        var result: [ModifierInfo] = []
        
        for (index, layoutItem) in collection.enumerated() {
            
            guard self.replace(index: index, layoutItem: layoutItem, maker) else {
                result.append(.init(index: index, item: layoutItem, result: false))
                continue
            }
            
            result.append(.init(index: index, item: layoutItem, result: true))
            
        }
        
        return result
    }
    
    public func remake(_ maker: MakeClosure) {
        remove()
        make(maker)
    }
    
    public func remove() {
        collection.forEach({
            $0.constraints.forEach({ $0.deactive() })
        })
    }

    // MARK: Methods Animate
    public func updateAnimate(_ updater: UpdateClosure, animateConfigs configs: LayoutAnimateConfiguration, isAnimated: Bool) {
        
        for (index, layoutItem) in collection.enumerated() {
            guard self.update(
                index: index, layoutItem: layoutItem, updater
            ) else {
                continue
            }
            
            if isAnimated {
                LayoutConstraintUpdater.animate(layoutItem, with: configs)
            }
        }
    
    }
    
    public func replaceAnimate(_ maker: MakeClosure, animateConfigs configs: LayoutAnimateConfiguration, isAnimated: Bool) {
        
        for (index, layoutItem) in collection.enumerated() {
            guard self.replace(
                index: index, layoutItem: layoutItem, maker
            ) else {
                continue
            }
            
            if isAnimated {
                LayoutConstraintUpdater.animate(layoutItem, with: configs)
            }
        }
    
    }
    
    // MARK: Internal
    internal func makeConstraints(with layoutItem: Collection.Element, in index: Int, _ maker: MakeClosure) -> [LayoutConstraint] {
        let builder = Builder(layoutItem: layoutItem)
        maker(index, layoutItem, builder)
        return compresion(builder.constraints)
    }

    internal func makeConstraints(with layoutItem: Collection.Element, in index: Int, _ updater: UpdateClosure) -> [LayoutConstraint] {
        let builder = Updater(layoutItem: layoutItem)
        updater(index, layoutItem, builder)
        return compresion(builder.constraints)
    }
    
    fileprivate func compresion(_ constraints: [LayoutConstraint]) -> [LayoutConstraint] {
        let compress = LayoutCompressionDict()
        constraints.forEach({ compress.add(node: $0) })
        return compress.allValues
    }
    
    @discardableResult
    internal func update(index: Int, layoutItem: Collection.Element, _ updater: UpdateClosure) -> Bool {
        
        let oldConstraints = layoutItem.constraints
        
        guard !oldConstraints.isEmpty else {
            return false
        }
        
        let constraints = makeConstraints(with: layoutItem, in: index, updater)
        
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
    internal func replace(index: Int, layoutItem: Collection.Element, _ maker: MakeClosure) -> Bool {
        
        let oldConstraints = layoutItem.constraints
        
        guard !oldConstraints.isEmpty else {
            self.make(maker)
            return false
        }
        
        let constraints = makeConstraints(with: layoutItem, in: index, maker)
        
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
    
}
