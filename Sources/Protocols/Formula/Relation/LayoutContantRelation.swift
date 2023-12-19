//
//  LayoutContantRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutContantRelation {
    
    func equal(to contant: LayoutContantValue) -> LayoutConstraint
    func greaterOrEqual(to contant: LayoutContantValue) -> LayoutConstraint
    func lessOrEqual(to contant: LayoutContantValue) -> LayoutConstraint
    
}
