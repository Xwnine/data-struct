//: Playground - noun: a place where people can play

import UIKit

//FIFO：本质上也是线性表。只允许在一段进行掺入操作，一段进行删除操作。如表头做入队操作，那么表位只能进行出队操作

struct Queue<T> {
    //数据存储单元
    var data = [T]()
    //队列中数据元素的个数
    var count: Int {
        return data.count
    }
    //队列是否为空
    var isEmpty: Bool {
        return data.isEmpty
    }
    //队头
    var front: T? {
        return data.first
    }
    //队尾
    var rear:T? {
        return data.last
    }
    
    //MARK: 遵循FIFO规则，表头删除元素，表尾插入元素
    
    //入队操作
    mutating func enqueue(_ element: T) {
        data.append(element)
    }
    
    //出队列操作: 采用数组的出队列操作，时间复杂依然是O(n)
    @discardableResult mutating func dequeue() -> T? {
        guard !isEmpty else {
            return nil
        }
        return data.removeFirst()
    }
    
    //清空
    mutating func dequeueAll() {
        while !isEmpty {
            dequeue()
        }
    }
}

struct AdvanceQueue<T> {
    var data = [T?]()
    var head = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var count: Int {
        return data.count - head
    }
    
    var front: T? {
        if isEmpty {
            return nil
        }
        return data[head]
    }
    
    var rear: T? {
        if isEmpty {
            return nil
        }
        return data.last!
    }
    
    mutating func enqueue(_ element: T) {
        data.append(element)
    }
    
    //因为数组每次删除一个元素之后，后继元素都需啊哟向前移动，因此，每次的删除操作 时间复杂度为O(n)。
    mutating func dequeue() -> T? {
        guard !isEmpty, head < data.count, let element = data[head] else {
            return nil
        }
        
        //使用可选类型来完成站位，这样时间复杂度就将为O(1)
        data[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(data.count)
        //当数组的长度超过了50，且占空比超过了25%，就直接删除掉head前的所有空槽
        if percentage > 0.25 && data.count > 50 {
            data.removeFirst(head)
            head = 0
        }
        return element
    }
}

//链表实现队列
class QueueNode<T> {
    var data: T
    var next: QueueNode?
    
    init(value: T = "" as! T) {
        data = value
    }
}

//从front处删除节点， 从rear处插入节点
class LinkedQueue<T> {
    typealias Node = QueueNode<T>

    //指向队列的头指针
    var front: Node?
    //对尾节点
    var tail: Node?
    
    init() {
        front = Node()
        tail = front
    }
    
    var count: Int {
        guard var node = front else {
            return 0
        }
        
        var count = 1
        while let next = node.next  {
            node = next
            count += 1
        }
        return count
    }
    
    var isEmpty: Bool {
        return front?.next == nil
    }
}

//MARK: Operation

extension LinkedQueue {
    //从表尾入队
    func enqueue(_ element: T) {
        let node = Node(value: element)
        tail?.next = node
        tail = node
        if isEmpty {
            front?.next = node
        }
    }
    
    //从表头删除节点
    @discardableResult func dequeue() ->T? {
        guard !isEmpty else {
            return nil
        }
        
        let newNode = front?.next
        front?.next = newNode?.next
        //释放节点
        newNode?.next = nil
        
        if front?.next == nil {
            tail = front //同步尾节点
        }
        return newNode?.data
    }
    
    func dequeueAll() {
        while !isEmpty {
            dequeue()
        }
    }
}









