import UIKit

var str = "Hello, playground"

class ListNode: Equatable {
    var data: Int
    var next: ListNode?
    
    init(_ value:Int) {
        data = value
        next = nil
    }
    
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.data == rhs.data && lhs.next == rhs.next
    }
}

class LinkMap {
    var head: ListNode?
    var tail: ListNode?
    var length: Int = 0
    init() {}
    func addToHead(value: Int) {
        let node = ListNode(value)
        guard let cur = head else {
            length = 1
            head = node
            tail = node
            return
        }
        node.next = cur
        head = node
        length += 1
    }
    
    func addAtTail(value: Int) {
        let node = ListNode(value)
        guard let _ = head, let tmpTail = tail else {
            length = 1
            head = node
            tail = node
            return
        }
        length += 1
        tmpTail.next = node
        tail = node
    }
    
    func delete(at index: Int) {
        guard let cur = head else {
            return
        }
        
        let previous = previousNode(at: index)
        if previous == head {
            head = cur.next
            cur.next = nil
            length -= 1
        }
        
        if let base = previous {
            previous?.next = base.next?.next
            length -= 1
        }
        
//        //先在表头添加一个哨兵
//        let fakeNode = ListNode(-1)
//        fakeNode.next = previousNode(at: index)
//        if let base = fakeNode.next {
//            previous?.next = base.next
//            length -= 1
//        }
//        head = fakeNode.next
    }
    
    func remove(_ value: Int) -> ListNode? {
        guard let _ = head else {
            return nil
        }
        
        //在表头添加一个哨兵节点
        let fakeNode = ListNode(NSNotFound)
        fakeNode.next = head
        //做删除节点的操作
        var prev:ListNode = fakeNode
        
        //用来遍历节点
        var current:ListNode? = head
        
        while let tmp = current {
            if tmp.data != value {
                prev.next = tmp
                prev = prev.next!
            }
            current = tmp.next
        }
        
        if prev.next != nil {
            prev.next = nil
        }
        head = fakeNode.next
        return head
    }
    
    
    func previousNode(at index: Int) -> ListNode? {
        guard var cur = head else {
            return nil
        }
        
        var position = 0
        while let tmp = cur.next, position != index {
            cur = tmp
            position += 1
        }
        return cur
    }
    
    
    func value(at index: Int) -> Int? {
        guard var cur = head, index >= length else {
            return nil
        }
        
        var position: Int = 0
        while let tmp = cur.next {
            if position == index {
                break
            }
            cur = tmp
            position += 1
        }
        return cur.data
    }
    
    func display() {
        guard var cur = head else {
            return
        }
        var values: String = String(format: "%d", cur.data)
        while let tmp = cur.next {
            values.append("->")
            cur = tmp
            values.append(String(cur.data))
        }
        print(values)
    }
}

extension LinkMap {
    
    func hacCycle(head: ListNode) -> Bool {
        var fast:ListNode? = head
        var slow:ListNode? = head
        
        while let tslow = fast, let tfast = tslow.next {
            slow = tfast
            fast = tfast.next
            if slow == fast {
                return true
            }
        }
        return false
    }
    
    func circleEntrence(head: ListNode) -> ListNode? {
        //找到环的入口
        var fast: ListNode? = head
        var slow: ListNode? = head
        
        while let tslow = fast, let tfast = tslow.next {
            slow = tfast
            fast = tfast.next
            if slow == fast {
                break
            }
        }
       
        if fast == nil || fast?.next == nil {
            return nil
        }
        
        fast = head
        while fast != slow {
            fast = fast?.next
            slow = slow?.next
        }
        return fast
    }
    
    func removeCycle(head: ListNode) ->ListNode? {
        //找到环的节点
        let entrence = circleEntrence(head: head)
        var fake = circleEntrence(head: head)
        //寻找环的尾节点
        while let tmp = fake?.next , tmp != entrence {
            fake = tmp
        }
        
        if fake != nil {
            fake!.next = nil
        }
        return fake
    }
}
