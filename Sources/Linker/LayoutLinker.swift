//
//  LayoutLinker.swift
//  WakeUI
//
//  Created by windy on 2023/12/18.
//

import UIKit

public class LayoutLinker: LayoutTargetProtocol, CustomReflectable {
    
    // MARK: Properties
    internal var toAnchor: LayoutConstraintAnchorTarget {
        .init(anchor: anchor, target: target)
    }
    
    public private(set) var maker: LayoutConstraintMaker
    
    // MARK: Init
    public required init(maker: LayoutConstraintMaker) {
        self.maker = maker
    }
    
    // MARK: CustomReflectable
    internal typealias ReflectableElement = (label: String?, value: Any)
    internal func elements() -> [ReflectableElement] {
        [
            ("anchor", anchor),
            ("target", String(describing: target))
        ]
    }
    
    public var customMirror: Mirror {
        .init(self, children: elements(), displayStyle: .class)
    }
    
}

// MARK: Position
public final class LayoutLinkerPositionX: LayoutLinker {
    
    public var left: LayoutLinkerPositionX {
        anchor += .left
        return self
    }
    
    public var right: LayoutLinkerPositionX {
        anchor += .right
        return self
    }
    
    public var centerX: LayoutLinkerPositionX {
        anchor += .centerX
        return self
    }
    
    public var leading: LayoutLinkerPositionX {
        anchor += .leading
        return self
    }
    
    public var trailing: LayoutLinkerPositionX {
        anchor += .trailing
        return self
    }

    public var leftMargin: LayoutLinkerPositionX {
        anchor += .leftMargin
        return self
    }
    
    public var rightMargin: LayoutLinkerPositionX {
        anchor += .rightMargin
        return self
    }
    
    public var centerXMargin: LayoutLinkerPositionX {
        anchor += .centerXMargin
        return self
    }

    public var leadingMargin: LayoutLinkerPositionX {
        anchor += .leadingMargin
        return self
    }
    
    public var trailingMargin: LayoutLinkerPositionX {
        anchor += .trailingMargin
        return self
    }
    
}

public final class LayoutLinkerPositionY: LayoutLinker {
    
    public var top: LayoutLinkerPositionY {
        anchor += .top
        return self
    }
    
    public var bottom: LayoutLinkerPositionY {
        anchor += .bottom
        return self
    }
    
    public var centerY: LayoutLinkerPositionY {
        anchor += .centerY
        return self
    }
    
    public var topMargin: LayoutLinkerPositionY {
        anchor += .topMargin
        return self
    }
    
    public var bottomMargin: LayoutLinkerPositionY {
        anchor += .bottomMargin
        return self
    }
    
    public var centerYMargin: LayoutLinkerPositionY {
        anchor += .centerYMargin
        return self
    }
    
    public var firstBaseline: LayoutLinkerPositionY {
        anchor += .firstBaseline
        return self
    }
    
    public var lastBaseline: LayoutLinkerPositionY {
        anchor += .lastBaseline
        return self
    }
    
}


public final class LayoutLinkerPositionCenter: LayoutLinker {
    
    public var center: LayoutLinkerPositionCenter {
        anchor += .center
        return self
    }
    
    public var centerMargins: LayoutLinkerPositionCenter {
        anchor += .centerMargins
        return self
    }
    
}

public final class LayoutLinkerPositionHorizontal: LayoutLinker {
    
    public var horizontal: LayoutLinkerPositionHorizontal {
        anchor += .horizontal
        return self
    }
    
    public var diretionHorizontal: LayoutLinkerPositionHorizontal {
        anchor += .diretionHorizontal
        return self
    }
    
    public var horizontalMargins: LayoutLinkerPositionHorizontal {
        anchor += .horizontalMargins
        return self
    }
    
    public var diretionHorizontalMargins: LayoutLinkerPositionHorizontal {
        anchor += .diretionHorizontalMargins
        return self
    }
    
}

public final class LayoutLinkerPositionVertical: LayoutLinker {
    
    public var vertical: LayoutLinkerPositionVertical {
        anchor += .vertical
        return self
    }
    
    public var diretionVertical: LayoutLinkerPositionVertical {
        anchor += .diretionVertical
        return self
    }
    
    public var verticalMargins: LayoutLinkerPositionVertical {
        anchor += .verticalMargins
        return self
    }
    
    public var diretionVerticalMargins: LayoutLinkerPositionVertical {
        anchor += .diretionVerticalMargins
        return self
    }
    
}

public final class LayoutLinkerPositionEdge: LayoutLinker {
    
    public var edge: LayoutLinkerPositionEdge {
        anchor += .edge
        return self
    }
    
    public var edgeMargins: LayoutLinkerPositionEdge {
        anchor += .edgeMargins
        return self
    }
    
}

// MARK: Size
public final class LayoutLinkerSize: LayoutLinker {
    
    public var width: LayoutLinkerSize {
        anchor += .width
        return self
    }
    
    public var height: LayoutLinkerSize {
        anchor += .height
        return self
    }
    
}

public final class LayoutLinkerSizeList: LayoutLinker {
    
    public var size: LayoutLinkerSizeList {
        anchor += .size
        return self
    }
    
}
