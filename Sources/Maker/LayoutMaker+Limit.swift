//
//  LayoutMaker+Limit.swift
//  Yang
//
//  Created by windy on 2023/12/22.
//

import Foundation

public final class LayoutMakerX:
    LayoutMaker<LayoutModifierX>,
    LayoutMakerProtocol
{
    
    // MARK: Types
    public typealias MakerReturn = LayoutMakerX
    
    public typealias ContantReturn = MakerReturn
    public typealias MultiplierReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
    public typealias ActiveReturn = Modifier
}

public final class LayoutMakerY:
    LayoutMaker<LayoutModifierY>,
    LayoutMakerProtocol
{
    
    // MARK: Types
    public typealias MakerReturn = LayoutMakerY
    
    public typealias ContantReturn = MakerReturn
    public typealias MultiplierReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
    public typealias ActiveReturn = Modifier
}

public final class LayoutMakerCenter:
    LayoutMaker<LayoutModifierCenter>,
    LayoutMakerProtocol
{
    
    // MARK: Types
    public typealias MakerReturn = LayoutMakerCenter
    
    public typealias ContantReturn = MakerReturn
    public typealias MultiplierReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
    public typealias ActiveReturn = Modifier
}

public final class LayoutMakerHorizontal:
    LayoutMaker<LayoutModifierHorizontal>,
    LayoutMakerProtocol
{
    
    // MARK: Types
    public typealias MakerReturn = LayoutMakerHorizontal
    
    public typealias ContantReturn = MakerReturn
    public typealias MultiplierReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
    public typealias ActiveReturn = Modifier
}

public final class LayoutMakerVertical:
    LayoutMaker<LayoutModifierVertical>,
    LayoutMakerProtocol
{
    
    // MARK: Types
    public typealias MakerReturn = LayoutMakerVertical
    
    public typealias ContantReturn = MakerReturn
    public typealias MultiplierReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
    public typealias ActiveReturn = Modifier
}

public final class LayoutMakerEdge:
    LayoutMaker<LayoutModifierEdge>,
    LayoutMakerProtocol
{
    
    // MARK: Types
    public typealias MakerReturn = LayoutMakerEdge
    
    public typealias ContantReturn = MakerReturn
    public typealias MultiplierReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
    public typealias ActiveReturn = Modifier
}


public final class LayoutMakerSize:
    LayoutMaker<LayoutModifierSize>,
    LayoutMakerProtocol
{
    
    // MARK: Types
    public typealias MakerReturn = LayoutMakerSize
    
    public typealias ContantReturn = MakerReturn
    public typealias MultiplierReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
    public typealias ActiveReturn = Modifier
}

public final class LayoutMakerSizeList:
    LayoutMaker<LayoutModifierSizeList>,
    LayoutMakerProtocol
{
    
    // MARK: Types
    public typealias MakerReturn = LayoutMakerSizeList
    
    public typealias ContantReturn = MakerReturn
    public typealias MultiplierReturn = MakerReturn
    public typealias PriorityReturn = MakerReturn
    public typealias IdentifierReturn = MakerReturn
    public typealias ActiveReturn = Modifier
}
