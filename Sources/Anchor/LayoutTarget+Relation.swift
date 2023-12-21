//
//  LayoutTarget+Relation.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import Foundation

// MARK: Parent & Sibling
extension LayoutTargetType: LayoutParentRelationImpl { }
extension LayoutTargetType: LayoutSiblingRelationImpl { }

// MARK: Position
public final class LayoutTargetPositionX<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
extension LayoutTargetPositionX: LayoutPositionXRelationImpl { }

public final class LayoutTargetPositionY<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
extension LayoutTargetPositionY: LayoutPositionYRelationImpl { }

// MARK: Position List
public final class LayoutTargetPositionCenter<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
extension LayoutTargetPositionCenter: LayoutPositionCenterRelationImpl { }

public final class LayoutTargetPositionHorizontal<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
extension LayoutTargetPositionHorizontal: LayoutPositionHorizontalRelationImpl { }

public final class LayoutTargetPositionVertical<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
extension LayoutTargetPositionVertical: LayoutPositionVerticalRelationImpl { }

public final class LayoutTargetPositionEdge<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
extension LayoutTargetPositionEdge: LayoutPositionEdgeRelationImpl { }

// MARK: Size
public final class LayoutTargetSize<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
extension LayoutTargetSize: LayoutSizeRelationImpl { }

public final class LayoutTargetSizeList<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
extension LayoutTargetSizeList: LayoutSizeListRelationImpl { }
