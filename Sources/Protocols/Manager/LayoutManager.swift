//
//  LayoutManager.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import Foundation

public protocol LayoutManager: LayoutBuilderPortocol, CustomReflectable {
    typealias ReflectableElement = (label: String?, value: Any)
    func elements() -> [ReflectableElement]
}

extension LayoutManager {
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
}
