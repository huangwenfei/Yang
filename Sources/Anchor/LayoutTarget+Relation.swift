//
//  LayoutTarget+Relation.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation

// MARK: Parent & Sibling
extension LayoutTarget: LayoutParentRelationImpl { }
extension LayoutTarget: LayoutSiblingRelationImpl { }

// MARK: Position
public final class LayoutTargetPositionX: LayoutTarget { }
extension LayoutTargetPositionX: LayoutPositionXRelationImpl { }

public final class LayoutTargetPositionY: LayoutTarget { }
extension LayoutTargetPositionY: LayoutPositionYRelationImpl { }

// MARK: Position List
public final class LayoutTargetPositionCenter: LayoutTarget { }
extension LayoutTargetPositionCenter: LayoutPositionCenterRelationImpl { }

public final class LayoutTargetPositionHorizontal: LayoutTarget { }
extension LayoutTargetPositionHorizontal: LayoutPositionHorizontalRelationImpl { }

public final class LayoutTargetPositionVertical: LayoutTarget { }
extension LayoutTargetPositionVertical: LayoutPositionVerticalRelationImpl { }

public final class LayoutTargetPositionEdge: LayoutTarget { }
extension LayoutTargetPositionEdge: LayoutPositionEdgeRelationImpl { }

// MARK: Size
public final class LayoutTargetSize: LayoutTarget { }
extension LayoutTargetSize: LayoutSizeRelationImpl { }

public final class LayoutTargetSizeList: LayoutTarget { }
extension LayoutTargetSizeList: LayoutSizeListRelationImpl { }
