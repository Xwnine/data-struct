//: Playground - noun: a place where people can play

import UIKit

class ListNode<T>{
    var value: T
    var next:ListNode?
    init(value: T) {
        self.value = value
    }
    
    init(data: T = "default" as! T) {
        self.value = data
    }
}

extension ListNode: Equatable {
    static func == (lhs: ListNode<T>, rhs: ListNode<T>) -> Bool {
        return lhs.next == rhs || lhs.next == rhs.next || lhs == lhs.next
    }
}


class LinkedList<T> {
    typealias Node = ListNode<T>
    //头节点
    var head: Node?
    //最后一个节点
//    var last: Node? {
//        guard var node = head else {
//            return nil
//        }
//        while let next = node.next {
//            if next.next == node { //当前节点next指针指向的是head节点
//                return next
//            }
//            node = next
//        }
//        //重新赋值
//        node.next = head
//        return node
//    }
    
    //最后一个节点
    var last: Node?
    var isEmpty: Bool {
        return count > 0
    }
    
    init() {
        head  = Node()
        last = head
    }

    var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            if next.next == node { //当前节点next指针指向的是head节点
                break
            }
            node = next
            count += 1
        }
        return count
    }
}

extension LinkedList {
    func node(at index: Int) -> Node {
        assert(head != nil, "链表为空")
        assert(index >= 0 && index < count, "下标不合法")
        if index == 0 {
            return head!
        }else {
            var base = head!.next
            for _ in 1..<index {
                if base?.next == head { //next指针指向的是head节点
                    break
                }
                base = base?.next
                if index == count-1 { //尾节点的next指针指向head
                    base?.next = head
                }
            }
            return base!
        }
    }
    
    subscript(index: Int) -> T {
        let newNode = node(at: index)
        return newNode.value
    }
    
    func insert(_ newNode: Node, at index: Int) {
        if index == 0 {
            newNode.next = head?.next
            head = newNode
        }else if index >= count {
            let base = self.node(at: index-1)
            newNode.next = base.next
            //最后一个节点的next指向head
            base.next = head
        }else {
            let prev = self.node(at: index-1)
            newNode.next = prev.next
            prev.next = newNode
        }
    }
}

extension LinkedList {
    func removeAll() {
        head = nil
    }
    
    func remove(at index: Int) ->T {
        let prev = node(at: index-1)
        let newNode = node(at: index)
        prev.next = newNode.next
        newNode.next = nil
        return newNode.value
    }
}



