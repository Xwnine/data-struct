import UIKit

class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let _ = l1 else {
            return l2
        }
        
        guard let _ = l2 else {
            return l1
        }
        
        var cur1: ListNode? = l1
        var cur2: ListNode? = l2
        //新链表的头结点
        var result: ListNode = ListNode(NSNotFound)
        //新的链表
        let resultHead: ListNode = result
        //向后进位标志位
        var carry: Int = 0
        
        //链表的长度也许不一致
        while cur1 != nil || cur2 != nil {
            let x = cur1 != nil ? cur1!.val : 0
            let y = cur2 != nil ? cur2!.val : 0
            
            //即使链表长度不一致，进位标志位依然是要加入到后续的遍历中
            let sum = x + y + carry
            //逢十进一
            carry = sum / 10
            result.next = ListNode(sum%10)
            result = result.next!
            
            //移动cur
            if cur1 != nil {
                cur1 = cur1!.next
            }
            
            if cur2 != nil {
                cur2 = cur2!.next
            }
        }
        //若刚好链表尾节点相加有进位
        if carry > 0 {
            result.next = ListNode(carry)
        }
        return resultHead.next
    }
}
