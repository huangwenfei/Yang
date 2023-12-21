//
//  LayoutLinker+Relation.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation

// MARK: Parent & Sibling
extension LayoutLinkerType: LayoutParentRelationImpl { }
extension LayoutLinkerType: LayoutSiblingRelationImpl { }

// MARK: Position
extension LayoutLinkerPositionX: LayoutPositionXRelationImpl { }
extension LayoutLinkerPositionY: LayoutPositionYRelationImpl { }

// MARK: Position List
extension LayoutLinkerPositionCenter: LayoutPositionCenterRelationImpl { }
extension LayoutLinkerPositionHorizontal: LayoutPositionHorizontalRelationImpl { }
extension LayoutLinkerPositionVertical: LayoutPositionVerticalRelationImpl { }
extension LayoutLinkerPositionEdge: LayoutPositionEdgeRelationImpl { }

// MARK: Size
extension LayoutLinkerSize: LayoutSizeRelationImpl { }
extension LayoutLinkerSizeList: LayoutSizeListRelationImpl { }
