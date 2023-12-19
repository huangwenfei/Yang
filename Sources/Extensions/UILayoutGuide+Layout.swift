//
//  UILayoutGuide+Layout.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

extension UILayoutGuide {
    
    public var yang: LayoutTargetManager {
        .init(layoutItem: self)
    }
    
    public var yanglink: LayoutTargetLinkerManager {
        .init(layoutItem: self)
    }
    
}

extension UILayoutGuide: LayoutItem { }
extension UILayoutGuide: LayoutItemPositionX {  }
extension UILayoutGuide: LayoutItemPositionY {  }
extension UILayoutGuide: LayoutItemSize {  }
