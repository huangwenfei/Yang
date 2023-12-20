//
//  LayoutContantRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutContantRelation {
    
    func equal(to contant: LayoutContantValue) -> LayoutConstraintMaker
    func greaterOrEqual(to contant: LayoutContantValue) -> LayoutConstraintMaker
    func lessOrEqual(to contant: LayoutContantValue) -> LayoutConstraintMaker
    
}
