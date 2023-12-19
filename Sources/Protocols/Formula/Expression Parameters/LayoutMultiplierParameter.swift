//
//  LayoutMultiplierParameter.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutMultiplierParameter {
    
    func multiplier(by value: LayoutMultiplierValue) -> LayoutConstraint
    func divided(by value: LayoutMultiplierValue) -> LayoutConstraint
    
}
