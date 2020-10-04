//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by MarK on 27.09.2020.
//  Copyright © 2020 MarK. All rights reserved.
//

import XCTest
import LinkedList

class LinkedListTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBasicOperationsWithInt() throws {
        let linkedList = LinkedList<Int>()
        XCTAssert(linkedList.head == nil)
        XCTAssert(linkedList.tail == nil)
        XCTAssert(linkedList.length == 0)
        linkedList.append(1)
        XCTAssert(linkedList.head?.value == 1)
        XCTAssert(linkedList.tail?.value == 1)
        XCTAssert(linkedList.length == 1)
        linkedList.append(2)
        XCTAssert(linkedList.head?.value == 1)
        XCTAssert(linkedList.head?.next?.value == 2)
        XCTAssert(linkedList.tail?.value == 2)
        XCTAssert(linkedList.length == 2)
        linkedList.append(555)
        XCTAssert(linkedList.tail?.value == 555)
        XCTAssert(linkedList.length == 3)
        linkedList.append(4)
        XCTAssert(linkedList.length == 4)
        linkedList.prepend(0)
        XCTAssert(linkedList.head?.value == 0)
        XCTAssert(linkedList.length == 5)
        linkedList.insert(3, at: 3)
        XCTAssert(linkedList.length == 6)
        linkedList.remove(at: 4)
        XCTAssert(linkedList.length == 5)
        linkedList.remove(at: 10) // Must do nothing
        XCTAssert(linkedList.length == 5)
        linkedList.remove(at: linkedList.length) // Must do nothing
        XCTAssert(linkedList.length == 5)
        linkedList.remove(at: -1) // Must do nothing
        XCTAssert(linkedList.length == 5)
        XCTAssert(linkedList.head?.value == 0)
        XCTAssert(linkedList.tail?.value == 4)
        linkedList.remove(at: 0)
        XCTAssert(linkedList.length == 4)
        XCTAssert(linkedList.head?.value == 1)
        XCTAssert(linkedList.tail?.value == 4)
        linkedList.remove(at: linkedList.length - 1)
        XCTAssert(linkedList.length == 3)
        XCTAssert(linkedList.head?.value == 1)
        XCTAssert(linkedList.tail?.value == 3)
        XCTAssert(linkedList.description == "[1, 2, 3]")
        linkedList.removeAll()
        XCTAssert(linkedList.head?.value == nil)
        XCTAssert(linkedList.tail?.value == nil)
        XCTAssert(linkedList.length == 0)
    }
    
    func testStrings() throws {
        let linkedList = LinkedList<String>()
        XCTAssert(linkedList.head == nil)
        XCTAssert(linkedList.tail == nil)
        XCTAssert(linkedList.length == 0)
        linkedList.append("One")
        XCTAssert(linkedList.head?.value == "One")
        XCTAssert(linkedList.tail?.value == "One")
        XCTAssert(linkedList.length == 1)
        linkedList.append("Two")
        XCTAssert(linkedList.head?.value == "One")
        XCTAssert(linkedList.head?.next?.value == "Two")
        XCTAssert(linkedList.tail?.value == "Two")
        XCTAssert(linkedList.length == 2)
        XCTAssert(linkedList.description == "[One, Two]")
        linkedList.remove(at: linkedList.length - 1)
        XCTAssert(linkedList.head?.value == "One")
        XCTAssert(linkedList.head?.next == nil)
        XCTAssert(linkedList.length == 1)
        linkedList.removeAll()
        XCTAssert(linkedList.head?.value == nil)
        XCTAssert(linkedList.tail?.value == nil)
        XCTAssert(linkedList.length == 0)
    }
    
    func testReverse() throws {
        let linkedList = LinkedList<Int>([0, 1, 2, 3, 4])
        XCTAssert(linkedList.head?.value == 0)
        XCTAssert(linkedList.tail?.value == 4)
        XCTAssert(linkedList.length == 5)
        XCTAssert(linkedList.description == "[0, 1, 2, 3, 4]")
        linkedList.reverse()
        XCTAssert(linkedList.length == 5, "Length must stay the same")
        XCTAssert(linkedList.description == "[4, 3, 2, 1, 0]")
        linkedList.removeAll()
    }
    
}
