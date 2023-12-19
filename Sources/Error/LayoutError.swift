//
//  LayoutError.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import Foundation

public enum LayoutError: Error {
    case noParent, noSibling
    case attributes
    case cantUpdate
}

extension LayoutError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noParent:
            return "必须要有父类才能布局"
        case .noSibling:
            return "它们没有相同的父亲，它们不是亲兄弟"
        case .attributes:
            return "参数错误，无法建立约束"
        case .cantUpdate:
            return "无法更新约束"
        }
    }
}
