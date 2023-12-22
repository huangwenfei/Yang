//
//  LayoutModifierProtocol.swift
//  Yang
//
//  Created by windy on 2023/12/22.
//

import Foundation

public protocol LayoutModifierProtocol:
    LayoutConstraintActiveImpl where Self.ActiveReturn == Void
{ }
