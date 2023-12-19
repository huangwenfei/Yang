//
//  LayoutSizeListAnchor.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutSizeListAnchor {
    
    /// - Tag: Types
    associatedtype SizeList: LayoutTargetProtocol
    
    /// - Tag: Size List
    var size: SizeList { get }
    
}
