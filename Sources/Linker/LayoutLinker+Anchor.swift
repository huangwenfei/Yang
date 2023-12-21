//
//  LayoutLinker+Anchor.swift
//  Yang
//
//  Created by windy on 2023/12/21.
//

import Foundation

// MARK: Position
public final class LayoutLinkerPositionX<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionXAnchor { }
public final class LayoutLinkerPositionY<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionYAnchor { }


public final class LayoutLinkerPositionCenter<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionCenterAnchor { }
public final class LayoutLinkerPositionHorizontal<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionHorizontalAnchor { }
public final class LayoutLinkerPositionVertical<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionVerticalAnchor { }
public final class LayoutLinkerPositionEdge<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionEdgeAnchor { }

// MARK: Size
public final class LayoutLinkerSize<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerSizeAnchor { }

public final class LayoutLinkerSizeList<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerSizeListAnchor { }
