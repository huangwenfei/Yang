//
//  LayoutLinkerSizeAnchor.swift
//  Yang
//
//  Created by windy on 2023/12/21.
//

import Foundation

public protocol LayoutLinkerSizeAnchor {  }

extension LayoutLinkerSizeAnchor where Self: LayoutTargetProtocol {
 
    public var width: Self {
        anchor += .width
        return self
    }
    
    public var height: Self {
        anchor += .height
        return self
    }
    
}
