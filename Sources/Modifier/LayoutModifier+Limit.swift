//
//  LayoutModifier+Limit.swift
//  Yang
//
//  Created by windy on 2023/12/22.
//

import Foundation

public class LayoutModifierX: LayoutModifier<LayoutReplacerX> {
}
public class LayoutModifierY: LayoutModifier<LayoutReplacerY> {
}

public class LayoutModifierCenter: LayoutModifier<LayoutReplacerCenter> { }
public class LayoutModifierHorizontal: LayoutModifier<LayoutReplacerHorizontal> { }
public class LayoutModifierVertical: LayoutModifier<LayoutReplacerVertical> { }

public class LayoutModifierEdge: LayoutModifier<LayoutReplacerEdge> { }

public class LayoutModifierSize: LayoutModifier<LayoutReplacerSize> { }

public class LayoutModifierSizeList: LayoutModifier<LayoutReplacerSizeList> { }
