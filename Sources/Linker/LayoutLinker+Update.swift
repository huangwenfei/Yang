//
//  LayoutLinkUpdate.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

// MARK: Position
public final class LayoutLinkUpdateX<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionXAnchor { }
public final class LayoutLinkUpdateY<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionYAnchor { }


public final class LayoutLinkUpdateCenter<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionCenterAnchor { }
public final class LayoutLinkUpdateHorizontal<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionHorizontalAnchor { }
public final class LayoutLinkUpdateVertical<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionVerticalAnchor { }
public final class LayoutLinkUpdateEdge<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerPositionEdgeAnchor { }

// MARK: Size
public final class LayoutLinkUpdateSize<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerSizeAnchor { }

public final class LayoutLinkUpdateSizeList<Maker: LayoutConstraintProtocol>: LayoutLinkerType<Maker>, LayoutLinkerSizeListAnchor { }
