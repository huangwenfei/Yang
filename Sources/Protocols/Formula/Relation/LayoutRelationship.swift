//
//  LayoutRelationship.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public struct LayoutRelationship {
    
    /// - Tag: Parent
    public static func haveParent(_ value: LayoutItem?) -> Bool {
        value?.parent != nil
    }
    
    public static func isParent(oneself: LayoutItem?, parentIs: LayoutItem?) -> Bool {
        let lhsParent = oneself?.parent
        if let value = parentIs as? LayoutTypes.LayoutGuideTarget {
            return
                lhsParent?.safeAreaLayoutGuide === value ||
                lhsParent?.layoutMarginsGuide === value ||
                lhsParent?.readableContentGuide === value
        }
        else if let value = parentIs as? LayoutTypes.LayoutViewTarget {
            return lhsParent === value
        }
        else {
            return false
        }
    }
    
    /// - Tag: Sibling
    public static func isSibling(lhs: LayoutItem?, rhs: LayoutSiblingMark) -> Bool {
        switch rhs {
        case .sibling(let layoutItem):
            return Self.isSibling(lhs: lhs, rhs: layoutItem)
        }
    }
    
    public static func isSibling(lhs: LayoutItem?, rhs: LayoutItem?) -> Bool {
        /// oneself
        guard lhs !== rhs else { return false }
        
        let lhsParent = lhs?.parent
        if let value = rhs as? LayoutTypes.LayoutGuideTarget {
            return
                value.owningView === lhsParent && (
                    lhsParent?.safeAreaLayoutGuide !== value ||
                    lhsParent?.layoutMarginsGuide !== value ||
                    lhsParent?.readableContentGuide !== value
                )
        }
        else if let value = rhs as? LayoutTypes.LayoutViewTarget {
            return lhsParent === value.parent
        }
        else {
            return false
        }
    }
    
    
}
