//
//  LayoutIdentifierParameter.swift
//  WakeUI
//
//  Created by windy on 2023/12/17.
//

import Foundation

public protocol LayoutIdentifierParameter: LayoutConstraintProtocol {
    
    associatedtype IdentifierReturn
    
    func identifier(_ value: LayoutIdentifierValue) -> IdentifierReturn
    
}
