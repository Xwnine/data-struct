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



/// 链表的翻转本质上是将链表的节点一个个移动到原本头部
class Solution {
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
