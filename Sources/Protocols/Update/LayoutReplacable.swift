//
//  LayoutReplacable.swift
//  Yang
//
//  Created by windy on 2023/12/24.
//

import Foundation

public protocol LayoutReplacable {
    func replaceIfCan()
    func replaceAnimateIfCan(configs: LayoutAnimateConfiguration, isAnimated: Bool)
}

extension LayoutReplacable {
    public func replaceAnimateIfCan(configs: LayoutAnimateConfiguration) {
        replaceAnimateIfCan(configs: configs, isAnimated: true)
    }
}
