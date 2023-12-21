//
//  LayoutLinker+Anchor.swift
//  Yang
//
//  Created by windy on 2023/12/21.
//

import Foundation

// MARK: Position
public final class LayoutLinkerPositionX: LayoutLinker, LayoutLinkerPositionXAnchor { }
public final class LayoutLinkerPositionY: LayoutLinker, LayoutLinkerPositionYAnchor { }


public final class LayoutLinkerPositionCenter: LayoutLinker, LayoutLinkerPositionCenterAnchor { }
public final class LayoutLinkerPositionHorizontal: LayoutLinker, LayoutLinkerPositionHorizontalAnchor { }
public final class LayoutLinkerPositionVertical: LayoutLinker, LayoutLinkerPositionVerticalAnchor { }
public final class LayoutLinkerPositionEdge: LayoutLinker, LayoutLinkerPositionEdgeAnchor { }

// MARK: Size
public final class LayoutLinkerSize: LayoutLinker, LayoutLinkerSizeAnchor { }

public final class LayoutLinkerSizeList: LayoutLinker, LayoutLinkerSizeListAnchor { }
