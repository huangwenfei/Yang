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
        }
        if let child = child as? LayoutTypes.LayoutGuideTarget {
            view.addLayoutGuide(child)
        }
    }
    
    public func removeFromParent(_ parent: LayoutTypes.LayoutViewTarget) {
        if let view = layoutItem as? LayoutTypes.LayoutViewTarget {
            view.removeFromSuperview()
        }
        if let guide = layoutItem as? LayoutTypes.LayoutGuideTarget {
            parent.removeLayoutGuide(guide)
        }
    }
    
    public func removeChild(_ child: LayoutItem) {
        guard let view = layoutItem as? LayoutTypes.LayoutViewTarget else {
            return
        }
        if let child = child as? LayoutTypes.LayoutViewTarget {
            child.removeFromSuperview()
        }
        if let child = child as? LayoutTypes.LayoutGuideTarget {
            view.removeLayoutGuide(child)
        }
    }
}
