//
//  LayoutLinkerPositionListAnchor.swift
//  Yang
//
//  Created by windy on 2023/12/21.
//

import Foundation

public protocol LayoutLinkerPositionCenterAnchor {  }

extension LayoutLinkerPositionCenterAnchor where Self: LayoutTargetProtocol {
    
    public var center: Self {
        anchor += .center
        return self
    }
    
    public var centerMargins: Self {
        anchor += .centerMargins
        return self
    }
    
}

public protocol LayoutLinkerPositionHorizontalAnchor {  }

extension LayoutLinkerPositionHorizontalAnchor where Self: LayoutTargetProtocol {
    
    public var horizontal: Self {
        anchor += .horizontal
        return self
    }
    
    public var diretionHorizontal: Self {
        anchor += .diretionHorizontal
        return self
    }
    
    public var horizontalMargins: Self {
        anchor += .horizontalMargins
        return self
    }
    
    public var diretionHorizontalMargins: Self {
        anchor += .diretionHorizontalMargins
        return self
    }
    
}

public protocol LayoutLinkerPositionVerticalAnchor {  }

extension LayoutLinkerPositionVerticalAnchor where Self: LayoutTargetProtocol {
    
    public var vertical: Self {
        anchor += .vertical
        return self
    }
    
    public var diretionVertical: Self {
        anchor += .diretionVertical
        return self
    }
    
    public var verticalMargins: Self {
        anchor += .verticalMargins
        return self
    }
    
    public var diretionVerticalMargins: Self {
        anchor += .diretionVerticalMargins
        return self
    }
    
}

public protocol LayoutLinkerPositionEdgeAnchor {  }

extension LayoutLinkerPositionEdgeAnchor where Self: LayoutTargetProtocol {
    
    public var edge: Self {
        anchor += .edge
        return self
    }
    
    public var edgeMargins: Self {
        anchor += .edgeMargins
        return self
    }
    
}
