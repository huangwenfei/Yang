//
//  LayoutLinkerSizeListAnchor.swift
//  Yang
//
//  Created by windy on 2023/12/21.
//

import Foundation

public protocol LayoutLinkerSizeListAnchor {  }

extension LayoutLinkerSizeListAnchor where Self: LayoutTargetProtocol {
    
    public var size: Self {
        anchor += .size
        return self
    }
    
}
