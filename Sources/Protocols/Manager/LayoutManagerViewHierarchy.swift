//
//  LayoutManagerViewHierarchy.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import UIKit

public protocol LayoutManagerViewHierarchy where Self: LayoutManager {
    
}

extension LayoutManagerViewHierarchy {
    public func addToParent(_ parent: LayoutTypes.LayoutViewTarget) {
        if let view = layoutItem as? LayoutTypes.LayoutViewTarget {
            parent.addSubview(view)
            view.saveState()
        }
        if let guide = layoutItem as? LayoutTypes.LayoutGuideTarget {
            parent.addLayoutGuide(guide)
        }
    }
    
    public func addChild(_ child: LayoutItem) {
        guard let view = layoutItem as? LayoutTypes.LayoutViewTarget else {
            return
        }
        if let child = child as? LayoutTypes.LayoutViewTarget {
            view.addSubview(child)
            child.saveState()
        }
        if let child = child as? LayoutTypes.LayoutGuideTarget {
            view.addLayoutGuide(child)
        }
    }
    
    public func removeFromParent(_ parent: LayoutTypes.LayoutViewTarget) {
        if let view = layoutItem as? LayoutTypes.LayoutViewTarget {
            view.removeFromSuperview()
            view.resetState()
        }
        if let guide = layoutItem as? LayoutTypes.LayoutGuideTarget {
            parent.removeLayoutGuide(guide)
        }
    }
    
    public func removeFromParent() {
        if let view = layoutItem as? LayoutTypes.LayoutViewTarget {
            view.removeFromSuperview()
            view.resetState()
        }
        if let guide = layoutItem as? LayoutTypes.LayoutGuideTarget {
            guide.parent?.removeLayoutGuide(guide)
        }
    }
    
    public func removeChild(_ child: LayoutItem) {
        guard let view = layoutItem as? LayoutTypes.LayoutViewTarget else {
            return
        }
        if let child = child as? LayoutTypes.LayoutViewTarget {
            child.removeFromSuperview()
            child.resetState()
        }
        if let child = child as? LayoutTypes.LayoutGuideTarget {
            view.removeLayoutGuide(child)
        }
    }
}

extension LayoutManagerViewHierarchy {
    
    public func addChilds(_ childs: [LayoutItem]) {
        childs.forEach({ addChild($0) })
    }
    
    public func removeChilds(_ childs: [LayoutItem]) {
        childs.forEach({ removeChild($0) })
    }
    
}

extension LayoutManagerViewHierarchy {
    
    public func saveState() {
        layoutItem.saveState()
    }
    
    public func resetState() {
        layoutItem.resetState()
    }
    
    public func saveChildStates(_ childs: [LayoutItem]) {
        childs.forEach({ $0.saveState() })
    }
    
    public func resetChildStates(_ childs: [LayoutItem]) {
        childs.forEach({ $0.resetState() })
    }
    
}
