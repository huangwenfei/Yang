//
//  LayoutSizeAnchor.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutSizeAnchor {
    
    /// - Tag: Types
    associatedtype Size: LayoutTargetProtocol
    
    /// - Tag: Size
    var width: Size { get }
    var height: Size { get }
    
}
