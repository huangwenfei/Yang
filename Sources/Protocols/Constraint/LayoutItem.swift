//
//  LayoutItem.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public protocol LayoutItem: AnyObject {  }

extension LayoutItem {
    
    // MARK: Real Cache
    internal var constraints: [LayoutConstraint] {
        (cache.allObjects as? [LayoutConstraint]) ?? []
    }
    
    // MARK: Parent
    internal var parent: LayoutTypes.LayoutViewTarget? {
        if let view = self as? UIView {
            return view.superview
        }
        
        if #available(iOS 9.0, OSX 10.11, *), let guide = self as? UILayoutGuide {
            return guide.owningView
        }
        
        return nil
    }
    
    // MARK: CURD
    internal func add(item: LayoutConstraint) {
        cache.add(item)
    }
    
    internal func remove(item: LayoutConstraint) {
        cache.remove(item)
    }
    
    internal func replace(item: LayoutConstraint, with new: LayoutConstraint) {
        remove(item: item)
        add(item: new)
    }
    
//    internal func find(by name: String) -> LayoutBuildItem {
//        cache.remove(item)
//    }
    
    // MARK: State For Sibling Or Parent Child
    internal func prepareAndSaveState() {
        guard let view = self as? LayoutTypes.LayoutViewTarget else {
            return
        }
        
        state.autoresizingMask = view.translatesAutoresizingMaskIntoConstraints
        
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    internal func resetState() {
        guard let view = self as? LayoutTypes.LayoutViewTarget else {
            return
        }
        
        view.translatesAutoresizingMaskIntoConstraints = state.autoresizingMask
    }
    
    // MARK: Private
    private var cache: NSMutableSet {
        get { 
            if let result = objc_getAssociatedObject(
                self, &CacheKeys.buildItems
            ) as? NSMutableSet {
                return result
            } else {
                let result = NSMutableSet()
                self.cache = result
                return result
            }
        }
        set { 
            objc_setAssociatedObject(
                self,
                &CacheKeys.buildItems,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    private var state: LayoutStateCache {
        get {
            if let result = objc_getAssociatedObject(
                self, &CacheKeys.stateCache
            ) as? LayoutStateCache {
                return result
            } else {
                let result = LayoutStateCache()
                self.state = result
                return result
            }
        }
        set {
            objc_setAssociatedObject(
                self,
                &CacheKeys.stateCache,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
}

fileprivate struct CacheKeys {
    
    static var buildItems: UInt8 = 0
    
    static var stateCache: UInt8 = 1
    
}
