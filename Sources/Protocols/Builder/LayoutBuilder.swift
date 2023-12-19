//
//  LayoutBuilder.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import Foundation

public protocol LayoutBuilderPortocol {
    var layoutItem: LayoutItem { get }
    init(layoutItem: LayoutItem)
}

public protocol LayoutBuilder: AnyObject, LayoutBuilderPortocol, CustomReflectable {
    var constraints: [LayoutConstraint] { get set }
    
    typealias ReflectableElement = (label: String?, value: Any)
    func elements() -> [ReflectableElement]
}

extension LayoutBuilder {
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
}
