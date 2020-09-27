//
//  LinkedList.Node.swift
//  LinkedList
//
//  Created by MarK on 27.09.2020.
//  Copyright © 2020 MarK. All rights reserved.
//

import Foundation

extension LinkedList {
    
    open class Node<T> {
        
        open var value: T
        open var next: Node?
        
        init(_ value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
        
    }
    
}
