//
//  LayoutPriorityParameter.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutPriorityParameter: LayoutConstraintProtocol {
    
    associatedtype PriorityReturn
    
    func priority(_ value: LayoutPriorityValue) -> PriorityReturn
    func priority(_ value: LayoutPriority) -> PriorityReturn
    func priority(_ value: LayoutPriority.SystemType) -> PriorityReturn
    
}
