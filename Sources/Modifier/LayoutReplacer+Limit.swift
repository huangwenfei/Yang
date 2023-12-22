//
//  LayoutReplacer+Limit.swift
//  Yang
//
//  Created by windy on 2023/12/22.
//

import Foundation

// MARK: Position
public final class LayoutReplacerX: LayoutReplacer { }
extension LayoutReplacerX: LayoutPositionXRelationImpl, LayoutCommonRelationImpl { }

public final class LayoutReplacerY: LayoutReplacer{ }
extension LayoutReplacerY: LayoutPositionYRelationImpl, LayoutCommonRelationImpl { }

// MARK: Position List
public final class LayoutReplacerCenter: LayoutReplacer { }
extension LayoutReplacerCenter: LayoutPositionCenterRelationImpl, LayoutCommonRelationImpl { }

public final class LayoutReplacerHorizontal: LayoutReplacer { }
extension LayoutReplacerHorizontal: LayoutPositionHorizontalRelationImpl, LayoutCommonRelationImpl { }

public final class LayoutReplacerVertical: LayoutReplacer { }
extension LayoutReplacerVertical: LayoutPositionVerticalRelationImpl, LayoutCommonRelationImpl { }

public final class LayoutReplacerEdge: LayoutReplacer { }
extension LayoutReplacerEdge: LayoutPositionEdgeRelationImpl, LayoutCommonRelationImpl { }

// MARK: Size
public final class LayoutReplacerSize: LayoutReplacer{ }
extension LayoutReplacerSize: LayoutSizeRelationImpl, LayoutCommonRelationImpl { }

public final class LayoutReplacerSizeList: LayoutReplacer { }
extension LayoutReplacerSizeList: LayoutSizeListRelationImpl, LayoutCommonRelationImpl { }
