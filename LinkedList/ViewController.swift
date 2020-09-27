//
//  ViewController.swift
//  LinkedList
//
//  Created by MarK on 16.09.2020.
//  Copyright © 2020 MarK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(555)
        linkedList.append(4)
        linkedList.prepend(0)
        linkedList.insert(3, at: 3)
        linkedList.remove(at: 4)
        print("Original:", linkedList)
        linkedList.reverse()
        print("Reversed:", linkedList)
        linkedList.removeAll()
    }
    
}
