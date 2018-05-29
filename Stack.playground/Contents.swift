//: Playground - noun: a place where people can play

import Foundation


//栈：是限定在表尾进行插入和删除操作的线性表。允许插入和删除的一端称为栈顶 top，另一端称为栈低 bottom。LIFO：具有后进先出的特点。

//C语言中，如果数据元素的变化不可预料，使用链栈这种数据结构，更合理，反之则使用顺序栈。而在swift中就不一样了，swift中的数组长度不是固定大小的，很多如pop()、drop等这些方法，在n 趋近于无限大，时间复杂度是O(n)

//MARK: 数组实现的堆栈
struct Stack<T> {
    var array:Array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() ->T? {
        return array.popLast()
    }
    
    var top: T? {
        return array.last
    }
}

//MARK: 链表实现的堆栈

class StackNode<T> {
    var data: T
    var next: StackNode?
    init(value: T) {
        self.data = value
    }
}

class LinkedStack<T> {
    typealias Node = StackNode<T>
    
    //指向栈顶的指针
    var top: Node?
    
    //栈中元素个数
    var count: Int {
        guard var node = top else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    //栈是否为空
    var isEmpty: Bool {
        return top === nil
    }
}

extension LinkedStack {
    //入栈操作，本质是向链表的头节点插入元素
    func push(data: T) {
        let newNode = Node(value: data)
        newNode.next = top
        top = newNode
    }
    
    //访问栈顶元素
    func topElement() -> T? {
        guard isEmpty else {
            return nil
        }
        return top?.data
    }
    
    //出栈操作，本质是删除链表的第一个元素
   @discardableResult func pop() -> T? {
        guard !isEmpty else {
            return nil
        }
        let base = top!.next
        top = base
        base?.next = nil
        return base?.data
    }
    
    //清空栈，需要遵循LIFO的原则，而不是单纯的让head = nil
    func popToTop () {
        while !isEmpty {
            pop()
        }
    }
}

