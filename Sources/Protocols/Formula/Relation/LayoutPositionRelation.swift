//
//  LayoutPositionRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/16.
//

import Foundation

public protocol LayoutPositionXRelation:
    LayoutParentRelation, LayoutParentPositionXRelation,
    LayoutSiblingRelation, LayoutSiblingPositionXRelation {
    
}

public protocol LayoutPositionYRelation:
    LayoutParentRelation, LayoutParentPositionYRelation,
    LayoutSiblingRelation, LayoutSiblingPositionYRelation {
    
}

public protocol LayoutPositionHorizontalRelation:
    LayoutParentRelation, LayoutParentPositionHorizontalRelation,
    LayoutSiblingRelation, LayoutSiblingPositionHorizontalRelation {
    
}

public protocol LayoutPositionVerticalRelation:
    LayoutParentRelation, LayoutParentPositionVerticalRelation,
    LayoutSiblingRelation, LayoutSiblingPositionVerticalRelation {
    
}

public protocol LayoutPositionEdgeRelation:
    LayoutParentRelation, LayoutParentPositionEdgeRelation,
    LayoutSiblingRelation, LayoutSiblingPositionEdgeRelation {
    
}

public protocol LayoutPositionCenterRelation:
    LayoutParentRelation, LayoutParentPositionCenterRelation,
    LayoutSiblingRelation, LayoutSiblingPositionCenterRelation {
    
}
