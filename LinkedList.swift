import Foundation

// 线性表的单链表存储结构

// 基本的节点结构
class ListNode {
    //数据域
    var element: Int = 0
    //指针域
    var next: ListNode?

    init(_ element: Int) {
        self.element = element
        self.next = nil
    }
}

// 链表
class LikedList {
    //头节点
    var head: ListNode?
    //尾节点
    var tail: ListNode?

    //链表长度，节点的个数
    var length: Int {
        guard var node = head else {
            return 0
        }
        var j = 1
        while let next = node.next {
            node = next
            j += 1
        }
        return j
    }

    //链表是否为空
    var isEmpty:Bool {
        return head == nil
    }

    //头结点
    var first: ListNode? {
        return head
    }

    //尾节点
    var last: ListNode? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }

    //查找指定位置的节点
    func node(at index: Int) -> ListNode? {
        if head == nil || index > length{ //链表为空，下标越界
            return nil
        }

        if index == 0 {
            return head!
        }

        var node = head!.next //拿到第一个节点
        for _ in 1 ..< index { 
            node = node?.next //node指向下一个节点
        }
        return node
    }

    //指定位置插入节点
    func insert(at index:Int, node: ListNode) {
        
        if index == 0 { //表头插入
            //新节点的next指向原来的head
            node.next = head
        }else if index == length { //尾部拼接
            if let lastNode = tail {
                lastNode.next = node
            }else {
                head.next = node
            }
        }else {
            //找到前一个节点
            let preNode = node(at: index-1)
            if preNode.next != nil {
                node.next = preNode.next
                preNode.next = node
            }else {
                head.next = next
            }
        }
    }
    //删除指定位置的节点
    func remove(at index: Int) {
        if isEmpty {return}
        if index >= length {
            return
        }

        //找到前一个节点
        let preNode = node(at: index-1)
        let node = self.node(at: index)
        preNode.next = node.next
        node.next = nil
    }

    //链表销毁
    func removeAll() {
        head = nil
        tail = nil
    }

    // 删除指定位置的节点
    func removeLast() {
        remove(at: length-1)
    }
}
