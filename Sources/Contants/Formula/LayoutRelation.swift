//
//  LayoutRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public enum LayoutRelation: Int {
    case greaterThanOrEqual, equal, lessThanOrEqual
}

extension LayoutRelation {
    public var nsRelation: LayoutTypes.LayoutConstraintTargetRelation {
        switch self {
        case .greaterThanOrEqual: return .greaterThanOrEqual
        case .equal:              return .equal
        case .lessThanOrEqual:    return .lessThanOrEqual
        }
    }
}

/// `Any <-> None` None is Nil
/// `someone <-> someone` One by One : Position vs Position , Size vs Size
/// `same <-> same` is Same
/// `[someone] <-> [someone]` (lhs.count == rhs.count)
/// `edge <-> edgeMargins` (lhs.count == rhs.count)
/// `diretionEdge <-> diretionEdgeMargins` (lhs.count == rhs.count)
/// `size <-> size` (lhs.count == rhs.count)
/// `Any -> Contant` Rhs nil and none
