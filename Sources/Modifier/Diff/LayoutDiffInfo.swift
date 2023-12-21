//
//  LayoutDiffInfo.swift
//  Yang
//
//  Created by windy on 2023/12/21.
//

import Foundation

public struct LayoutDiffInfo {
    
    // MARK: Properties
    public let label: String
    public let oldValue: Any?
    public let newValue: Any?
    
    // MARK: Init
    public init(label: String, oldValue: Any?, newValue: Any?) {
        self.label = label
        self.oldValue = oldValue
        self.newValue = newValue
    }
    
}
