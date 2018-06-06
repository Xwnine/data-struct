import UIKit

var str = "选择排序"

//选择排序的基本思想就是在每一趟 n-i+1(i=1,2,....,n-1)个记录中选取关键字最小的记录作为有序序列的第i个记录。


/// 基本选择排序算法
///
/// - Parameter array: [Int]
func selected_sort(array: inout [Int]) {
	var i = 0, j = 0
	var min = 0 //定义一个下标，记录最小值
	
	while i < array.count {
		min = i //将当前下标标记为最小下标
		j = i + 1
		while j < array.count {
			if array[j] < array[min] { 
				min = j //更新最小元素的下标
			}
			j += 1
		}
		if i != min {
			_swapInt(array: &array, i: i, j: min)
			print("selected_sort: min=\(min), array:\(array)")
		}
		i += 1
	}
}


/// 交换函数
///
/// - Parameters:
///   - array: 数据
///   - i: 要交换的下标
///   - j: 要交换的下标
func _swapInt(array: inout [Int], i: Int, j: Int) {
	let temp = array[i]
	array[i] = array[j]
	array[j] = temp
}



//MARK：test

var arrayInt = [9,1,5,8,3,7,4,6,2]
selected_sort(array: &arrayInt)
