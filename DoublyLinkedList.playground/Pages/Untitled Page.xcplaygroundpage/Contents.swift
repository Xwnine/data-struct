//: Playground - noun: a place where people can play

import UIKit

class ListNode<T> {
    //节点存储的值
    var value: T
    init(value: T) {
        self.value = value
    }
    //直向下一个节点的指针
    var next: ListNode<T>?
    //指向当前节点的前一个节点的指针
    weak var previous : ListNode<T>?
}

class LinkedList<T> {
    typealias Node = ListNode<T>
    //头节点
    var head: Node?
    //最后一个节点
    var last: Node? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    //链表是否为空
    var isEmpty: Bool {
        return head === nil
    }
    
    //节点元素个数
    var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
}

//MARK： 访问链表节点
extension LinkedList {
    //MARK: 访问节点元素
    func node(at index: Int) -> Node {
        assert(head != nil, "链表为空")
        assert(index >= 0 && index < count, "下标越界")
        if index == 0 {
            return head!
        }else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
            }
            return node!
        }
    }
    //下标访问
    subscript(index: Int) -> T {
        let newNode = node(at: index)
        return newNode.value
    }
}

extension LinkedList {
    //MARK: 插入
    func insert(_ newNode: Node, at index: Int) {
        if index == 0 { //头节点后插入
            newNode.next = head //新节点的next指针指向原先的head节点
            head?.previous = newNode //就的节点的previous指针指向node
            head = newNode //同步头结点
        }else if index >= count { //尾部拼接
            if let lastNode = last {
                newNode.next = lastNode
                lastNode.next = newNode
            }else {
                head = newNode
            }
        }else {
            let prev = node(at: index - 1)
            let next = prev.next

            prev.next = newNode
            newNode.previous = prev
            
            newNode.next = next
            next?.previous = newNode
        }
    }
    
    //插入指定元素到指定节点
    func insert(_ value: T, at index: Int) {
        let newNode = node(at: index)
        insert(newNode, at: index)
    }
    
    //插入一个链表
    func insert(_ list: LinkedList, at index: Int) {
        guard !isEmpty else {
            return
        }
    
        if index == 0 {
            list.last?.next = head //新链表尾节点next指针指向原本链表的头结点
            head?.previous = list.last //
            head = list.head //头部节点

        }else if index >= count { //尾部拼接
            if let lastNode = last {
                lastNode.next = list.head
                list.head?.previous = lastNode
            }else {
                head = list.head
            }
        }else {
            let prev = node(at: index - 1)
            let next = prev.next
            
            prev.next = list.head
            list.head = prev
            
            list.last?.next = next
            next?.previous = list.last
        }
    }
}

//MARK： 删除
extension LinkedList {
    func removeAll() {
        head = nil
    }
    
    func remove(at index: Int) -> T {
        let newNode = node(at: index)
        
        let prev = newNode.previous
        let next = newNode.next
        
        if let prev = prev {
            prev.next = next
        }else {
            head = next
        }
        next?.previous = prev
        
        newNode.previous = nil
        newNode.next = nil
        return newNode.value
    }

    func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = node.next
        }else {
            head = next
        }
        
        next?.previous = prev
        next?.previous = nil
        next?.next = nil
        return node.value
    }
}

extension LinkedList {
    //链表翻转
    func reverse() {
        guard !isEmpty else {
            return
        }
        var node = head
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous) //交换节点的前后指针
            head = currentNode
        }
    }
	

	
	/// 单链表翻转
	///
	/// - Parameter k: 要反转的节点个数
	func reverse(k: Int) {
		guard !isEmpty else{
			return
		}
		var count = 1
		var newNode = head!.next
		var oldNode = newNode!.next
		
		while count < k {
			var temp = oldNode?.next
			oldNode?.next = newNode
			newNode = oldNode
			oldNode = temp
			count += 1
		}
		head!.next?.next = oldNode
	}
}




