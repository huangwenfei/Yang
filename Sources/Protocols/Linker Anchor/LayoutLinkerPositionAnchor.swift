//
//  LayoutLinkerPositionAnchor.swift
//  Yang
//
//  Created by windy on 2023/12/21.
//

import Foundation

public protocol LayoutLinkerPositionXAnchor {  }

extension LayoutLinkerPositionXAnchor where Self: LayoutTargetProtocol {
    
    public var left: Self {
        anchor += .left
        return self
    }
    
    public var right: Self {
        anchor += .right
        return self
    }
    
    public var centerX: Self {
        anchor += .centerX
        return self
    }
    
    public var leading: Self {
        anchor += .leading
        return self
    }
    
    public var trailing: Self {
        anchor += .trailing
        return self
    }

    public var leftMargin: Self {
        anchor += .leftMargin
        return self
    }
    
    public var rightMargin: Self {
        anchor += .rightMargin
        return self
    }
    
    public var centerXMargin: Self {
        anchor += .centerXMargin
        return self
    }

    public var leadingMargin: Self {
        anchor += .leadingMargin
        return self
    }
    
    public var trailingMargin: Self {
        anchor += .trailingMargin
        return self
    }
    
}



public protocol LayoutLinkerPositionYAnchor {  }

extension LayoutLinkerPositionYAnchor where Self: LayoutTargetProtocol {
    
    public var top: Self {
        anchor += .top
        return self
    }
    
    public var bottom: Self {
        anchor += .bottom
        return self
    }
    
    public var centerY: Self {
        anchor += .centerY
        return self
    }
    
    public var topMargin: Self {
        anchor += .topMargin
        return self
    }
    
    public var bottomMargin: Self {
        anchor += .bottomMargin
        return self
    }
    
    public var centerYMargin: Self {
        anchor += .centerYMargin
        return self
    }
    
    public var firstBaseline: Self {
        anchor += .firstBaseline
        return self
    }
    
    public var lastBaseline: Self {
        anchor += .lastBaseline
        return self
    }
    
    
}
