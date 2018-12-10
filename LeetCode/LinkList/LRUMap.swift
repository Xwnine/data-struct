//
//  LRUMap.swift
//  LRUCache
//
//  Created by awen on 2018/10/17.
//  Copyright © 2018 awen. All rights reserved.
//

//双链表实现LRU缓存淘汰算法

import Foundation

class ListNode: Equatable {
    /// 存储的值
    var val: AnyObject?
    /// key
    var key: String?
    /// 内存开销
    var cost: UInt = 0
    /// 存入的时间戳
    var time: TimeInterval = 0.0
    var next: ListNode?
    weak var prev: ListNode?
    
    init(_ val: AnyObject) {
        self.val = val
        self.next = nil
        self.prev = nil
    }
    
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.key == rhs.key && lhs.next == rhs.next && lhs.prev == rhs.prev
    }
    
}

class LRUMap {
    /// 节点总数
    var totalCount: UInt = 0
    /// 总的开销
    var totalCost: UInt = 0
    
    var head: ListNode?
    var tail: ListNode?
    
    /// key：节点的key, value: 节点
    var hashTable: CFMutableDictionary
    
    init() {
        self.hashTable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, nil,nil)
    }
    
    /// 在表头插入节点，会更新链表的节点个数和内存开销
    ///
    /// - Parameter node: Node和 key不可以为空
    func insertAtHead(_ node: ListNode) {
        guard let key = node.key else {
            return
        }
        //存入节点
        CFDictionaryAddValue(hashTable, key, Unmanaged.passRetained(node).autorelease().toOpaque())
        totalCost += node.cost
        totalCount += 1
    
        guard let _ = head else {
            head = node
            tail = node
            return
        }
        node.prev = nil //非必须，但是为了安全，还是多做这一步
        node.next = head!
        head!.prev = node
        head = node
    }
    
    /// 将节点移动到表头
    ///
    /// - Parameter node: 节点必须是在dic中存在的
    func bringToHead(_ node: ListNode) {
        
    }
    
    /// 删除节点，会更新链表中的节点个数和内存开销
    ///
    /// - Parameter node: 节点必须是dictionary中存在的
    func remove(_ node: ListNode) {
        guard let key = node.key else {
            return
        }
        CFDictionaryRemoveValue(hashTable, key)
        totalCost -= node.cost
        totalCount -= 1
        
        if node.next != nil {
            node.next!.prev = node.prev
        }
        
        if node.prev != nil {
            node.prev!.next = node.next
        }
        
        if head == node {
            head = node.next
        }
        
        if tail == node {
            tail = node.prev
        }
    }
    
    /// 删除尾节点
    ///
    /// - Returns: 如果存在尾节点，返回被删除的尾节点
    func removeTail() -> ListNode? {
        guard let _ = tail else {
            return tail
        }
        
        let tmpTail = tail!
        totalCost -= tail!.cost
        totalCount -= 1
        if head == tail {
            head = nil
            tail = nil
        }else {
            tail = tail!.prev
            tail!.next = nil
        }
        return tmpTail
    }
    
    /// 删除所有节点
    func removeAll() {
        totalCost = 0
        totalCount = 0
        
        head = nil
        tail = nil

        if CFDictionaryGetCount(hashTable) > 0 {
            CFDictionaryRemoveAllValues(hashTable)
        }
    }
}
