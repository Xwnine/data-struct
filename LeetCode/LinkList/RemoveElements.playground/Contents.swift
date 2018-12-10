import UIKit

var str = "Hello, playground"
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
    self.val = val
    self.next = nil
    }
}

class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let _ = head else {
            return nil
        }
        
        //在表头添加一个哨兵节点
        let fakeNode = ListNode(NSNotFound)
        fakeNode.next = head
        var prev:ListNode = fakeNode
        var current:ListNode? = head
        while let tmp = current {
            if tmp.val != val {
                prev.next = tmp
                prev = prev.next!
            }
            current = tmp.next
        }
        
        if prev.next != nil {
            prev.next = nil
        }
        return fakeNode.next
    }
}
