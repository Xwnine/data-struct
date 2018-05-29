//: Playground - noun: a place where people can play

import UIKit

var str = "二分查找(搜索)树"

/*
	1.非空左子树的所有键值小于其根节点的键值
	2.非空右子树的所有键值大于其跟节点的键值
	3.左、右子树都是二叉搜索树
 
	4.最大元素一定是在树的最右分支的端节点上
	5.最小元素一定是在树的最左分支的端节点上

	6.删除节点：如果有右节点，再去找右边最小的那个顶上，如果没有右节点，左节点顶上，要是都木有，那就删了

*/

class TreeNode {
	var data: Int
	
	var leftChild: TreeNode?
	var rightChild: TreeNode?
		
	init(data: Int) {
		self.data = data
	}
}


class BinarySearchTree {
	//指向树的根节点
	var root: TreeNode?
	//一组数据
	var items:[Int]
	//初始化方法
	init(datas: [Int]) {
		self.items = datas
		root = createBST()
	}
	
	//就是不断的去插入节点
	@discardableResult private func createBST() -> TreeNode? {
		if !items.isEmpty {
			return nil
		}
		
		var temp = TreeNode(data: items[0])
		for index in 1 ..< items.count  { //只需要从第一个元素开始遍历
			temp = insertBST(data: items[index], node: temp)
		}
		return temp
	}
	
	//插入节点
	@discardableResult func insertBST(data: Int, node: TreeNode?) -> TreeNode {
		guard let rootNode = node else {
			return TreeNode(data: data)
		}
	
		if rootNode.data > data { //在左侧插入
			rootNode.leftChild = insertBST(data: data, node: rootNode.leftChild)
		}else { //在右侧插入
			rootNode.rightChild = insertBST(data: data, node: rootNode.rightChild)
		}
		return rootNode
	}
	//查找最小数据
	func findMinData(node: TreeNode?) -> TreeNode? { //最小值在最左分支的端节点上
		guard var left = node else {
			return nil
		}
		while left.leftChild != nil {
			left = left.leftChild!
		}
		return left
	}
	
	//查找最大数据
	func findMaxData(node: TreeNode?) -> Int? {
		guard var right = node else {
			return nil
		}
		
		while right.rightChild != nil {
			right = right.rightChild!
		}
		return right.data
	}
	
	//查找指定元素，返回对应的节点
	func findData(data: Int, node: TreeNode?) -> TreeNode? {
		var temp = node
		while temp != nil {
			if temp!.data > data { //元素在左边
				temp = temp!.leftChild
			} else if temp!.data < data { //元素在右边
				temp = temp!.rightChild 
			}
		}
		return  temp
	}
	
	func deleteNode(data: Int, node: TreeNode?) -> TreeNode? {
		var temp: TreeNode?
		guard var tree: TreeNode = node  else {
			return node
		}
		
		if tree.data > data { //左边递归删除
			tree.leftChild = deleteNode(data: data, node: tree.leftChild)
			
		}else if tree.data < data { //右边递归删除
			tree.rightChild = deleteNode(data: data, node: tree.rightChild)
			
		}else { //当前节点就是要删除的节点
			if tree.leftChild != nil && tree.rightChild != nil { //被删除的节点有左右两个子节点
		
				temp = findMinData(node: tree.rightChild!) //右子树中找最小的元素填充删除节点
				tree.data = temp!.data
				
				tree.rightChild = deleteNode(data: tree.data, node: tree.rightChild) //删除节点的右子树中删除最小元素
				
			} else { //当前被删除的节点有一个或无子节点
				temp = tree 
				if tree.leftChild != nil { //只有左孩子节点
					tree = tree.leftChild!
				} else if tree.rightChild != nil { //只有右孩子节点
					tree = tree.rightChild!
				}
				temp = nil
			}
		}
		return tree
	}
}







