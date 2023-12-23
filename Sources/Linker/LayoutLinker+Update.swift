//
//  LayoutLinkUpdate.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

// MARK: Position
public final class LayoutLinkUpdateX<Maker: LayoutConstraintProtocol>:
    LayoutLinkerUnrelation<Maker>,
    LayoutLinkerPositionXAnchor,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutLinkUpdateX
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

public final class LayoutLinkUpdateY<Maker: LayoutConstraintProtocol>:
    LayoutLinkerUnrelation<Maker>,
    LayoutLinkerPositionYAnchor,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutLinkUpdateY
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}


public final class LayoutLinkUpdateCenter<Maker: LayoutConstraintProtocol>:
    LayoutLinkerUnrelation<Maker>,
    LayoutLinkerPositionCenterAnchor,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutLinkUpdateCenter
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

public final class LayoutLinkUpdateHorizontal<Maker: LayoutConstraintProtocol>:
    LayoutLinkerUnrelation<Maker>,
    LayoutLinkerPositionHorizontalAnchor,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutLinkUpdateHorizontal
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

public final class LayoutLinkUpdateVertical<Maker: LayoutConstraintProtocol>:
    LayoutLinkerUnrelation<Maker>,
    LayoutLinkerPositionVerticalAnchor,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutLinkUpdateVertical
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

public final class LayoutLinkUpdateEdge<Maker: LayoutConstraintProtocol>:
    LayoutLinkerUnrelation<Maker>,
    LayoutLinkerPositionEdgeAnchor,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutLinkUpdateEdge
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

// MARK: Size
public final class LayoutLinkUpdateSize<Maker: LayoutConstraintProtocol>:
    LayoutLinkerUnrelation<Maker>,
    LayoutLinkerSizeAnchor,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutLinkUpdateSize
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

public final class LayoutLinkUpdateSizeList<Maker: LayoutConstraintProtocol>:
    LayoutLinkerUnrelation<Maker>,
    LayoutLinkerSizeListAnchor,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutLinkUpdateSizeList
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}
