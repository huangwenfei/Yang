//
//  LayoutFormulaRelation.swift
//  WakeUI
//
//  Created by windy on 2023/12/15.
//

import UIKit

public protocol LayoutFormulaRelation { }

/// - Tag: Contant
extension Int: LayoutFormulaRelation { }
extension UInt: LayoutFormulaRelation { }
extension Float: LayoutFormulaRelation { }
extension Double: LayoutFormulaRelation { }
extension CGFloat: LayoutFormulaRelation { }

extension CGSize: LayoutFormulaRelation { }
extension CGPoint: LayoutFormulaRelation { }

extension UIEdgeInsets: LayoutFormulaRelation { }

/// - Tag: Layout Target
extension UIView: LayoutFormulaRelation { }
extension UILayoutGuide: LayoutFormulaRelation { }

///// - Tag: Special Target
//extension LayoutConstraintTarget: LayoutFormulaRelation { }
