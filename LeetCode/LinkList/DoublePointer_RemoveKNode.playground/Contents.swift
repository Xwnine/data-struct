import UIKit

var str = "Hello, playground"

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val;
        self.next = nil
    }
}

//删除链表的倒数第N个节点

class Solution {

    func removeNthFromEndPro(_ head: ListNode?, _ n: Int) -> ListNode? {
        if n < 0 {
            return nil
        }
        
        guard let _ = head else {
            return nil
        }
 
        var preNode = head
        var curNode = head
   
        var count:Int = 0
        while count < n {
            curNode = curNode?.next
            count += 1
        }
        
        if curNode == nil {
            return preNode?.next
        }
        
        while let tmp = curNode!.next {
            preNode = preNode?.next
            curNode = tmp
        }
        
        preNode?.next = preNode?.next?.next
        return head
    }
}
