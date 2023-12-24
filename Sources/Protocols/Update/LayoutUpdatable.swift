//
//  LayoutUpdatable.swift
//  Yang
//
//  Created by windy on 2023/12/19.
//

import Foundation

public protocol LayoutUpdatable {
    func updateIfCan()
    func updateAnimateIfCan(configs: LayoutAnimateConfiguration, isAnimated: Bool)
}

extension LayoutUpdatable {
    public func updateAnimateIfCan(configs: LayoutAnimateConfiguration) {
        updateAnimateIfCan(configs: configs, isAnimated: true)
    }
}
