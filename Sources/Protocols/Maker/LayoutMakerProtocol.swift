//
//  LayoutMakerProtocol.swift
//  Yang
//
//  Created by windy on 2023/12/22.
//

import Foundation

public protocol LayoutMakerProtocol:
    LayoutConstraintOffsetImpl,
    LayoutConstraintMultiplierImpl,
    LayoutConstraintPriorityImpl,
    LayoutConstraintIdentifierImpl
{
    
}

public protocol LayoutUpdaterProtocol:
    LayoutConstraintOffsetImpl,
    LayoutConstraintPriorityImpl,
    LayoutConstraintIdentifierImpl
{
    
}
