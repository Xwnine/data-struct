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
		createBST()
	}
	
	//就是不断的去插入节点
	private func createBST(){
		if items.isEmpty {
			return
		}
		for data in items  {
			//查找节点
			let base = search(data: data)
			if !base.isFound {
				insert(data: data, node: base.fatherNode)
			}
		}
	}
	
	
	/// 插入节点
	///
	/// - Parameters:
	///   - data: 要插入的元素
	///   - node: 父节点
	
	func insert(data: Int, node: TreeNode?) {
		guard let temp = node else { //么父节点
			root = TreeNode(data:data)
			return 
		}
		
		if temp.data > data {
			node!.leftChild = TreeNode(data: data)
		}else if temp.data < data {
			node!.rightChild = TreeNode(data: data)
		}
	}
		
	/// 查找最小元素节点
	///
	/// - Parameter node: 根节点
	/// - Returns: 目标节点
	
	func minData(node: TreeNode?) -> TreeNode? { //最小值在最左分支的节点上
		guard let _ = root else {
			return nil
		}
		
		var left = root!.leftChild
		while left != nil {
			left = left!.leftChild
		}
		return left
	}
		
	/// 查找最大元素
	///
	/// - Parameter node: 根节点
	/// - Returns: 
	
	func maxData(node: TreeNode?) -> TreeNode? {
		guard let _ = node else {
			return nil
		}
		
		var right = root!.rightChild
		while right != nil {
			right = right!.rightChild
		}
		return right
	}
	
	//
	/// 元素查找
	///
	/// - Parameter data: 目标元素
	/// - Returns: 元组(结果标志位，目标节点， 父节点)
	func search(data: Int) -> (isFound: Bool, target: TreeNode?, fatherNode: TreeNode?) {
		guard let _ = root else { //空树
			return (false, nil, nil)
		}
		
		var temp = root
		var base: TreeNode? //目标节点
		var isFound = false

		while temp != nil {
			base = temp //记录当前节点
			if temp!.data > data { //元素在左边
				temp = temp!.leftChild
			} else if temp!.data < data { //元素在右边
				temp = temp!.rightChild 
			}
		}
	
		if temp!.data == data { //找到节点
			isFound = true
		}
		return (isFound, base, temp)
	}
	
	
	/// 删除元素
	///
	/// - Parameter data: 需要删除的元素
	func delete(data: Int) {
		let searchData = search(data: data)
		if searchData.isFound {
			delete(data: data, node: searchData.fatherNode)
		}
	}
	
	//MARK: 右子树中寻找最小元素来填充目标节点数据域，然后将最小元素节点删除
//	func delete(data: Int, node: TreeNode?) -> TreeNode? {
//		guard var tree: TreeNode = node  else {
//			return nil
//		}
	
		//		var temp: TreeNode?
//		if tree.data > data { //左边递归删除
//			tree.leftChild = delete(data: data, node: tree.leftChild)
//
//		}else if tree.data < data { //右边递归删除
//			tree.rightChild = delete(data: data, node: tree.rightChild)
//			
//		}else { //当前节点就是要删除的节点
//			if tree.leftChild != nil && tree.rightChild != nil { //被删除的节点有左右两个子节点
//				temp = minData(node: tree.rightChild!) //右子树中找最小的元素填充删除节点
//				tree.data = temp!.data
//				tree.rightChild = delete(data: tree.data, node: tree.rightChild) //删除节点的右子树中删除最小元素
//			} else { //当前被删除的节点有一个或无子节点
//				if tree.leftChild != nil { //只有左孩子节点
//					tree = tree.leftChild!
//				} else if tree.rightChild != nil { //只有右孩子节点
//					tree = tree.rightChild!
//				}
//				temp = nil
//			}
//		}
//		return tree
//	}
//	
	//MARK: 左子树中寻找最大元素来填充目标节点数据域，然后将最大元素节点删除
	private func delete(data: Int, node: TreeNode?) -> TreeNode? {
		guard var tree: TreeNode = node else {
			return nil;
		}
		
		var temp: TreeNode?
		if tree.data > data  { //左边递归删除
			tree.leftChild = delete(data: data, node: tree.leftChild)
			
		}else if tree.data < data {
			tree.rightChild = delete(data: data, node: tree.rightChild)
		}else { //找到当前要删除的节点
			if tree.leftChild != nil && tree.rightChild != nil { //最复杂的情况，有左右子节点
				temp = maxData(node: tree.leftChild)
				tree.data = temp!.data
				tree.leftChild = delete(data: data, node: tree.leftChild!)
			}else {
				if tree.leftChild != nil {
					tree = tree.leftChild!
				}else if tree.rightChild != nil {
					tree = tree.rightChild!
				}
				temp = nil
			}
		}
		return tree
	}
}




