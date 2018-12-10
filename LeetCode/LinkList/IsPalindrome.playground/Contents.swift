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
    func isPalindrome(_ head: ListNode?) ->Bool {
        guard let _ = head else {
            return true
        }
        //快慢指针
        var slow = head
        var fast = head
        var reverseHead: ListNode? = nil
        //翻转链表的前半部分
        while fast?.next != nil {
            fast = fast!.next!.next
            let next = slow?.next
            slow?.next = reverseHead
            reverseHead = slow
            slow = next
        }
        //如果链表长度为奇数
        if fast != nil {
            slow = slow?.next
        }
        
        while slow != nil {
            if slow?.val != reverseHead?.val {
                return false
            }
            slow = slow!.next
            reverseHead = reverseHead?.next
        }
        return true
    }
}
