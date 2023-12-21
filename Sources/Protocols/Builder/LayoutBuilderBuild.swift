//
//  LayoutBuilderBuild.swift
//  WakeUI
//
//  Created by windy on 2023/12/19.
//

import Foundation

public protocol LayoutBuilderBuild where Self: LayoutBuilder { }

extension LayoutBuilderBuild {
    
    public func make(_ maker: (_ maker: Self) -> Void) {
        maker(self)
        compresion()
        constraints.forEach({ $0.active() })
    }
    
    public func update(_ maker: (_ maker: Self) -> Void) {
        guard layoutItem.constraints.isEmpty else {
            make(maker)
            return
        }
        
        constraints.forEach({ constraint in
            let existings = layoutItem.constraints.reduce([], {
                $0 + $1.constraints
            })
            
            constraint.constraints.forEach({ item in
                guard let update = existings.first(where: { $0 == item }) else {
                    fatalError(
                        String(describing: constraint) +
                            LayoutError.cantUpdate.localizedDescription
                    )
                }

                let isUsingFirst = update.secondAttribute == .notAnAttribute
                let attribute = isUsingFirst ? update.firstAttribute : update.secondAttribute
                
                let formula = constraint.formula
                let identifier = constraint.identifier
                
                update.constant = formula.constant.yangContantValue(by: attribute)
                update.priority = formula.priority.yangPriorityUIValue
                update.identifier = identifier
                
            })
            
        })
    
    }
    
    public func remake(_ maker: (_ maker: Self) -> Void) {
        remove()
        make(maker)
    }
    
    public func remove() {
        constraints.forEach({ $0.deactive() })
        constraints = []
    }
    
}

extension LayoutBuilderBuild {
    
    fileprivate func compresion() {
        let compress = LayoutCompressionDict()
        constraints.forEach({ compress.add(node: $0) })
        constraints = compress.allValues
    }
    
}
