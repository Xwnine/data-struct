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
    
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard let _ = head else {
            return nil
        }
        
        var odd: ListNode = head!
        var even: ListNode? = head!.next
        let evenHead: ListNode? = even
        
        while odd.next != nil && even?.next != nil {
            odd.next = even?.next
            odd = odd.next!
            
            even?.next = odd.next
            even = even?.next
        }
        odd.next = evenHead
        return head
    }
    
}



