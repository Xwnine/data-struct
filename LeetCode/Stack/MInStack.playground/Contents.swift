import UIKit

var str = "Hello, playground"


class ListNode  {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class MinStack {
    //栈顶
    var topNode: ListNode?
    //存储那些出现过的小元素
    var stack: Array<Int> = [Int]()
    
    init() {}
    
    func push(_ x: Int) {
        let node = ListNode(x)
        node.next = topNode
        topNode = node
        
        if stack.isEmpty || stack.first! >= x {
            stack.insert(x, at: 0)
        }
    }
    
    func pop() {
        if topNode != nil {
            if stack.first != nil, topNode!.val == stack.first {
                stack.remove(at: 0)
            }
            topNode = topNode!.next
        }else {
            stack.removeAll()
        }
    }
    
    func top() -> Int {
        if topNode != nil {
            return topNode!.val
        }
        return NSNotFound
    }
    
    func getMin() -> Int {
        if stack.first != nil {
            return stack.first!
        }
        return NSNotFound
    }
}

