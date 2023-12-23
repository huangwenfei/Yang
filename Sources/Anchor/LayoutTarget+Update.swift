//
//  LayoutTarget+Update.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

// MARK: Position
public final class LayoutTargetUpdateX<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
public final class LayoutTargetUpdateY<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }

// MARK: Position List
public final class LayoutTargetUpdateCenter<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
public final class LayoutTargetUpdateHorizontal<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
public final class LayoutTargetUpdateVertical<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
public final class LayoutTargetUpdateEdge<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }

// MARK: Size
public final class LayoutTargetUpdateSize<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
public final class LayoutTargetUpdateSizeList<Maker: LayoutConstraintProtocol>: LayoutTargetType<Maker> { }
