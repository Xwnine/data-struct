//: Playground - noun: a place where people can play

import Foundation

var str = "儿子-兄弟表示法"

//二叉树的顺序存储
/*
    完全二叉树：从上到下，从左到右顺序存储，非根节点与父节点的位置与当前节点的位置关系：|i/2| , i是当前节点的位置
 */

//链表存储 ：儿子-兄弟表示法

class TreeNode {
	//数据域
    var data: String
    //左孩子节点
    var left: TreeNode?
    //右孩子节点
    var right: TreeNode?
    
    init(data: String = "default") {
        self.data = data
    }
}

class Tree {
    //指向根节点的指针
    var root: TreeNode?
	fileprivate var index: Int = -1
    //数据
    var items:[String]
    init(items: [String]) {
        self.items = items
		self.root = buildPreOrderTree()
    }
	
	//树的深度
	func maxDepth(node: TreeNode?) -> Int {
		guard let node = node else {
			return 0
		}
		return max(maxDepth(node:node.left), maxDepth(node: node.right)) + 1
	}
	
	//先序递归创建树：根、左、右
	func buildPreOrderTree() -> TreeNode? {
		index += 1
		if index < items.count {
			let item = items[index];
			if item == "" {
				return nil
			}
	
			let node = TreeNode(data: items[index])
			print(node)
			node.left = buildPreOrderTree()
			node.right = buildPreOrderTree()
			return node
		}
		return nil
	}
	
	//中序递归创建树：左、根、右
	func bulidMidOrderTree() -> TreeNode? {
		index += 1
		if index < items.count {
			let item = items[index];
			if item == "" {
				return nil
			}
			
			let node = TreeNode()
			node.left = bulidMidOrderTree()
			node.data = items[index]
			node.right = bulidMidOrderTree()
			return node
		}
		return nil
	}
	
	//后序递归创建树：左、右、根
	func buildLastOrderTree() ->TreeNode? {
		index += 1
		if index < items.count  {
			let item = items[index];
			if item == "" {
				return nil
			}

			let node = TreeNode()
			node.left = buildLastOrderTree()
			node.right = buildLastOrderTree()
			node.data = items[index]
			return node
		}
		return nil
	}
	
	//MARK: 遍历
	
	//先序遍历
	func preOrderTraversal(tree: TreeNode?) {
		guard let node = tree else {
			print("空树")
			return
		}
		print(node.data)
		preOrderTraversal(tree: node.left)
		preOrderTraversal(tree: node.right)
	}
	
	//中序遍历
	func inOrderTraversal(tree: TreeNode?) {
		guard let node = tree else {
			print("树为空");
			return
		}
		inOrderTraversal(tree: node.left)
		print(node.data)
		inOrderTraversal(tree: node.right)
	}
	
	//后序遍历
	func postOrderTraversal(tree: TreeNode?) {
		guard let node = tree else {
			print("树为空")
			return
		}
		postOrderTraversal(tree: node.left)
		postOrderTraversal(tree: node.right)
		print(node.data)
	}
	
//	//层序遍历
//	func levelOrderTranversal(tree: TreeNode?) {
//		guard let node = tree else {
//			print("树为空")
//			return
//		}
//		print(node.data)
//		print(node.left?.data)
//		print(node.right?.data)
//		levelOrderTranversal(tree: node.left)
//		levelOrderTranversal(tree: node.right)
//	}
}

//堆栈 LIFO
struct Stack<T> {
	var array:Array = [T]()
	
	var isEmpty: Bool {
		return  array.isEmpty
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
}

//FIFO
struct Queue<T> {
	var data: Array = [T]()
	var isEmpty: Bool {
		return data.isEmpty
	}
	
	mutating func enqueue(_ element: T) {
		data.append(element)
	}
	
	mutating func dequeue() -> T? {
		guard !isEmpty else {
			return nil
		}
		return data.removeFirst()
	}
	
	var count: Int {
		return data.count
	}
}


//非递归的方法实现树的遍历
extension Tree {
	//根、左、右
	func proPreOrderTraversal(tree: TreeNode?) {
		guard let _ = tree else {
			print("树为空")
			return
		}
		
		var node = tree
		var stack = Stack<TreeNode>()
		//遍历
		while !stack.isEmpty || node != nil {
			if let temp = node { //访问根节点，同时将叶子节点入栈
				print(temp.data)
				stack.push(temp)
				node = temp.left
			}else {
				node = stack.pop() //节点出栈
				node = node!.right //转向右子树
			}
		}
	}
	
	//左、根、右
	func proInOrderTraversal(tree: TreeNode?) {
		guard let _ = tree else {
			print("空树")
			return
		}
		
		var node = tree
		var stack = Stack<TreeNode>()
		while !stack.isEmpty || node != nil { //一直沿途向左，将沿途节点入栈
			if let temp = node {
				stack.push(temp)
				node = temp.left
			}else {
				node = stack.pop() //节点出栈
				print(node!.data) //访问根节点
				node = node!.right //转向右子树
			}
		}
	}
	
	//左、右、根
	func proPostOrderTraversal(tree: TreeNode?) {
		guard let _ = tree else {
			print("空树: ")
			return
		}
		
		var node = tree
		var stack = Stack<TreeNode>()
		while !stack.isEmpty || node != nil { //一直向左，将沿途节点入栈
			if let temp = node {
				stack.push(temp)
				node = temp.left
			}else {
				node = stack.pop() //节点出栈
				node = node!.right //转向右子树
				print(node!.data)
			}
		}
	}
	
	//层级遍历
	func proLevelOrderTraversal(tree: TreeNode?) {
		guard let _ = tree else {
			print("空树")
			return
		}
		
		var queue = Queue<TreeNode>()
		//首先将根节点入队列
		queue.enqueue(tree!)
		while !queue.isEmpty  { //队列不为空
			//节点出队列
			let temp = queue.dequeue()
			
			//左右节点入队列
			if let left = temp!.left {
				queue.enqueue(left)
			}
			if let right = temp!.right {
				queue.enqueue(right)
			}
			//打印当前节点数据
			print(temp!.data)
		}
	}
	
	//之字形遍历二叉树，按层次打印节点元素
	func funTraversal(tree: TreeNode?) {
		guard let _ = tree else {
			print("二叉树为空")
			return
		}
		
		var queue = Queue<TreeNode>()
		while !queue.isEmpty {
		
			for _ in 0 ..< queue.count {
				//取出节点、打印、遍历左右节点
				let node = queue.dequeue()
				print(node!.data)

				if let left = node?.left {
					queue.enqueue(left)
				}
				
				if let right = node?.right {
					queue.enqueue(right)
				}
			}
		}
	}
}

//MARK: 测试

let items: Array<String> = ["A", "B", "D", "", "", "E", "", "", "C", "","F", "", ""]
let tree: Tree = Tree(items: items)
tree.preOrderTraversal(tree: tree.root)
print("\n--------------------------\n")
tree.inOrderTraversal(tree: tree.root)
print("\n--------------------------\n")
tree.postOrderTraversal(tree: tree.root)


