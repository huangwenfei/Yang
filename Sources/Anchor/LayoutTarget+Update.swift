//
//  LayoutTarget+Update.swift
//  Yang
//
//  Created by windy on 2023/12/23.
//

import Foundation

// MARK: Position
public final class LayoutTargetUpdateX<Maker: LayoutConstraintProtocol>:
    LayoutTargetUnrelation<Maker>,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutTargetUpdateX
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

public final class LayoutTargetUpdateY<Maker: LayoutConstraintProtocol>:
    LayoutTargetUnrelation<Maker>,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutTargetUpdateY
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}


public final class LayoutTargetUpdateCenter<Maker: LayoutConstraintProtocol>:
    LayoutTargetUnrelation<Maker>,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutTargetUpdateCenter
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

public final class LayoutTargetUpdateHorizontal<Maker: LayoutConstraintProtocol>:
    LayoutTargetUnrelation<Maker>,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutTargetUpdateHorizontal
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

public final class LayoutTargetUpdateVertical<Maker: LayoutConstraintProtocol>:
    LayoutTargetUnrelation<Maker>,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutTargetUpdateVertical
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

public final class LayoutTargetUpdateEdge<Maker: LayoutConstraintProtocol>:
    LayoutTargetUnrelation<Maker>,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutTargetUpdateEdge
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

// MARK: Size
public final class LayoutTargetUpdateSize<Maker: LayoutConstraintProtocol>:
    LayoutTargetUnrelation<Maker>,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutTargetUpdateSize
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}

public final class LayoutTargetUpdateSizeList<Maker: LayoutConstraintProtocol>:
    LayoutTargetUnrelation<Maker>,
    LayoutUpdaterProtocol
{
    // MARK: Types
    public typealias MakerReturn = LayoutTargetUpdateSizeList
    
    public typealias ContantReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
}
