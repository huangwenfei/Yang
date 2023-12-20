//
//  LayoutMultiplierParameter.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutMultiplierParameter: LayoutConstraintProtocol {
    
    associatedtype MultiplierReturn
    
    func multiplier(by value: LayoutMultiplierValue) -> MultiplierReturn
    func divided(by value: LayoutMultiplierValue) -> MultiplierReturn
    
}
