//
//  LayoutAnchors.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public protocol LayoutAnchors:
    LayoutPositionAnchor, 
    LayoutPositionHorizontalAnchor, LayoutPositionVerticalAnchor,
    LayoutPositionEdgeAnchor, LayoutPositionCenterAnchor,
    LayoutSizeAnchor, 
    LayoutSizeListAnchor
{ }
