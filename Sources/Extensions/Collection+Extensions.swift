//
//  Collection+Extensions.swift
//  Yang
//
//  Created by windy on 2024/3/8.
//

import Foundation

extension Collection where Self.Element: LayoutItem {
    
    public var yangbatch: LayoutBatchListManager<Self> {
        .init(collection: self)
    }
    
}

#if false

import UIKit

func listTest() {
    
    let array: [UIButton] = []
    
    array.yangbatch.make { index, item, make in
        make.left.equalToParent()
    }
    
}

#endif
