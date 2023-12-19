//
//  LayoutSizeRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutSizeRelation: 
    LayoutParentRelation, LayoutParentSizeRelation,
    LayoutSiblingRelation, LayoutSiblingSizeRelation,
    LayoutContantRelation {
    
}

public protocol LayoutSizeListRelation:
    LayoutParentRelation, LayoutParentSizeListRelation,
    LayoutSiblingRelation, LayoutSiblingSizeListRelation,
    LayoutContantRelation {
    
}
