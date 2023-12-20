//
//  LayoutContantParameter.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutContantParameter: LayoutConstraintProtocol {
    
    associatedtype ContantReturn
    
    func offset(_ value: LayoutContantOffsetValue) -> ContantReturn
    
    func offsetPoint(_ value: LayoutContantPointValue) -> ContantReturn
    func offsetSize(_ value: LayoutContantSizeValue) -> ContantReturn
    func offsetEdge(_ value: LayoutContantEdgeValue) -> ContantReturn
    
}
