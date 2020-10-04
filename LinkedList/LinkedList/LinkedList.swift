//
//  LinkedList.swift
//  LinkedList
//
//  Created by MarK on 16.09.2020.
//  Copyright © 2020 MarK. All rights reserved.
//

import Foundation

open class LinkedList<T> {
    
    private(set) open var head: Node<T>?
    private(set) open var tail: Node<T>?
    
    private(set) open var length: Int = 0
    
    open var isEmpty: Bool { head == nil }
    
    public init() {
    }
    
    public init<S: Sequence>(_ value: S? = nil) where S.Element == T {
        value?.forEach(append)
    }
    
    open func prepend(_ value: T) {
        let newNode = Node(value)
        if let head = head {
            newNode.next = head
            self.head = newNode
        } else {
            head = newNode
            tail = newNode
        }
        length += 1
    }
    
    open func append(_ value: T) {
        let newNode = Node(value)
        if let tail = tail {
            tail.next = newNode
            self.tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
        length += 1
    }
    
    open func insert(_ value: T, at index: Int) {
        guard index > -1, index < length else {
            tail?.next = Node(value)
            tail = tail?.next
            length += 1
            return
        }
        let prevNode = getNodeAt(index - 1)
        let nextNode = prevNode?.next
        prevNode?.next = Node(value, next: nextNode)
        length += 1
    }
    
    @discardableResult
    open func remove(at index: Int) -> Node<T>? {
        guard (0..<length).contains(index) else {
            return nil
        }
        guard index > 0 else {
            let currentNode = head
            head = currentNode?.next
            length -= 1
            return currentNode
        }
        let prevNode = getNodeAt(index - 1)
        let currentNode = prevNode?.next
        let nextNode = prevNode?.next?.next
        prevNode?.next = nextNode
        if prevNode?.next == nil {
            tail = prevNode
        }
        length -= 1
        return currentNode
    }
    
    open func removeAll() {
        head = nil
        tail = nil
        length = 0
    }
    
    open func reverse() {
        var prevNode: Node<T>? = nil
        var currentNode = head
        var nextNode = currentNode?.next
        tail = currentNode
        repeat {
            currentNode?.next = prevNode
            prevNode = currentNode
            currentNode = nextNode
            nextNode = nextNode?.next
        } while currentNode != nil
        head = prevNode
    }
    
    private func getNodeAt(_ index: Int) -> Node<T>? {
        guard index >= 0, index < length else { return nil }
        var returnNode: Node<T>?
        var currentNode = head
        for i in 0...index {
            if i == index {
                returnNode = currentNode
            }
            currentNode = currentNode?.next
        }
        return returnNode
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    open var description: String {
        var desc = "["
        var node = head
        while node != nil {
            if let value = node?.value {
                desc += "\(value)"
            }
            if node?.next != nil {
                desc += ", "
            }
            node = node?.next
        }
        desc += "]"
        return desc
    }
    
}
