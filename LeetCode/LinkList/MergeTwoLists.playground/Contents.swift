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

/*
    将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
    示例：
        输入：1->2->4, 1->3->4
        输出：1->1->2->3->4->4
*/


class Solution {
    
    /*
        思路：在一个while 循环中，遍历l1，l2，比较当前被遍历到的节点，val小的节点拼接到新链表中，向前移动当前val小的节点，
    */
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let _ = l1 else {
            return l2
        }
        
        guard let _ = l2 else {
            return l1
        }
        var cur1: ListNode? = l1
        var cur2: ListNode? = l2
        //新链表的遍历游标，记录新链表的最后一个节点
        var result: ListNode = ListNode(NSNotFound)
        //指向新链表的头部
        let resultHead: ListNode = result
        
        //遍历l1，l2， 新链表
        while cur1 != nil && cur2 != nil {
            if cur1!.val > cur2!.val {
                result.next = cur2!
                result = result.next!
                //l2游标移动
                cur2 = cur2!.next
            }else {
                result.next = cur1!
                result = result.next!
                //l1游标移动
                cur1 = cur1!.next
            }
        }
        
        if cur1 == nil && cur2 != nil {
            result.next = cur2!
        }
        
        if cur2 == nil && cur1 != nil {
            result.next = cur1
        }
        
        return resultHead.next
    }
}
