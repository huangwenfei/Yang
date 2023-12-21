//
//  LayoutAnchorTargetProtocol.swift
//  Yang
//
//  Created by windy on 2023/12/20.
//

import Foundation

public protocol LayoutAnchorTargetProtocol {
    var anchor: LayoutAnchor { get }
    var target: LayoutItem? { get }
    
    init(anchor: LayoutAnchor, target: LayoutItem?)
}
