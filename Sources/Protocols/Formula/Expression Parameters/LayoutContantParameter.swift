//
//  LayoutContantParameter.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutContantParameter {
    
    func offset(_ value: LayoutContantOffsetValue) -> LayoutConstraint
    
    func offsetPoint(_ value: LayoutContantPointValue) -> LayoutConstraint
    func offsetSize(_ value: LayoutContantSizeValue) -> LayoutConstraint
    func offsetEdge(_ value: LayoutContantEdgeValue) -> LayoutConstraint
    
}
