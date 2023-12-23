//
//  UIView+Layout.swift
//  WakeUI
//
//  Created by windy on 2023/12/14.
//

import UIKit

extension UIView {
    
    public var yang: LayoutTargetManager {
        .init(layoutItem: self)
    }
    
    public var yanglink: LayoutTargetLinkerManager {
        .init(layoutItem: self)
    }
    
    public var yangbatch: LayoutBatchManager {
        .init(layoutItem: self)
    }
    
}

extension UIView: LayoutItem {  }
extension UIView: LayoutItemPositionX {  }
extension UIView: LayoutItemPositionY {  }
extension UIView: LayoutItemSize {  }
