//
//  LayoutFormula+Operator.swift
//  WakeUI
//
//  https://docs.swift.org/swift-book/documentation/the-swift-programming-language/advancedoperators
//
//  https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations/#Operator-Declaration
//
//  https://developer.apple.com/documentation/swift/operator-declarations
//
//  Created by windy on 2023/12/15.
//

import Foundation

infix operator .=: AssignmentPrecedence

public func .= (lhs: LayoutTarget, rhs: LayoutParentMark) {
//    lhs.equal(to: <#T##LayoutParentMark#>)
}

public func .= (lhs: LayoutTarget, rhs: LayoutSiblingMark) {
//    lhs.equal(to: <#T##LayoutParentMark#>)
}

public func .= (lhs: LayoutTarget, rhs: LayoutTarget) {
    
}




