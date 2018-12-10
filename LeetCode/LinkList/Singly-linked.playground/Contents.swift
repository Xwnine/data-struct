import UIKit

var str = "Hello, playground"


class ListNode: Equatable {
    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
    
    var val:Int = 0
    weak var next: ListNode?
    init(_ data: Int) {
        val = data
    }
}

class LinkMap {
    var head: ListNode?
    var tail: ListNode?
    var length: Int = 0

    init() {}
    func addToHead(val: Int) {
        let node = ListNode(val)
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
    
    func addAtTail(val: Int) {
        let node = ListNode(val)
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
            var next = base.next
            previous?.next = next?.next
            next = nil
            length -= 1
        }
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
    
    func val(at index: Int) -> Int? {
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

        return cur.val
    }
    
    func display() {
        guard var cur = head else {
            return
        }
        var vals: String = String(format: "%d", cur.val)
        while let tmp = cur.next {
            vals.append("->")
            cur = tmp
            vals.append(String(cur.val))
        }
        print(vals)
    }
    
    func display(_ head: ListNode?) {
        guard var cur = head else {
            return
        }
        var vals: String = String(format: "%d", cur.val)
        while let tmp = cur.next {
            vals.append("->")
            cur = tmp
            vals.append(String(cur.val))
        }
        print(vals)
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let _ = head else {
            return head
        }
        //遍历链表节点的游标
        var curNode = head
        //记录当前节点的下一个节点
        var nextNode: ListNode? = nil
        //记录当前节点的前驱节点
        var preNode:ListNode? = nil
        
        while let tmpNode = curNode {
            //记录当前节点的下一个节点
            nextNode = tmpNode.next
            //当前节点的下一个节点指向前驱
            tmpNode.next = preNode
            //记录当前节点为前驱节点
            preNode = tmpNode
            //移动遍历游标
            curNode = nextNode
        }
        return preNode
    }
}

let listMap = LinkMap()
print(listMap)
listMap.addAtTail(val: 1)
listMap.addAtTail(val: 1)
listMap.addAtTail(val: 2)
listMap.addAtTail(val: 1)
listMap.display()

//listMap.head = listMap.reverseList(listMap.head)



