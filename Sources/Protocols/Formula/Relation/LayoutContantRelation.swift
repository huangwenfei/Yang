//
//  LayoutContantRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutContantRelation: LayoutTargetProtocol {
    
    func equal(to contant: LayoutContantValue) -> Maker
    func greaterOrEqual(to contant: LayoutContantValue) -> Maker
    func lessOrEqual(to contant: LayoutContantValue) -> Maker
    
}
