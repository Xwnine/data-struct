//: Playground - noun: a place where people can play

import UIKit

var str = "冒泡排序"

//冒泡排序最基本思想：两两比较相邻记录的关键字，如果相反则交换，知道没有反序为止


/// 基本的交换排序（不满足比较相邻记录）
///
/// - Parameter array: 数组
func swap_sort(array: inout [Int]) {
	var i = 0, j = 0
	while i < array.count {
		j = i+1
		while j < array.count {
			if array[i] > array[j] {
				_swapInt(array: &array, i: i, j: j)
				print("swap_sort: i=\(i) j=\(j)\n\(array)")
			}
			j += 1
		}
		i+=1
	}
}


/// 冒泡排序
///
/// - Parameter array: [Int]
func bubble_sort(array: inout [Int]) {
	var i=0, j=0
	while i < array.count {
		j = array.count-1 //反向循环
		while j >= i {
			if array[i] > array[j] {
				_swapInt(array: &array, i: i, j: j)
				print("bubble_sort i=\(i) j=\(j)\n\(array)")
			}
			j -= 1
		}
		i += 1
	}
}


/// 冒泡排序优化后的算法，可以过滤掉对已有序的数据的y无意义循环判断
/// 
/// - Parameter array: [Int]
func bubble_sort_pro(array: inout [Int]) {
	
	var flag = true /* flag 作为标记 */
	var i = 0, j = 0
	while i < array.count && flag {
		flag = false
		j = array.count - 1
		while j >= i {
			if array[i] > array[j] {
				_swapInt(array: &array, i: i, j: j)
				flag = true  /*有交换数据，flag 为true */
				print("bubble_sort_pro i=\(i) j=\(j)\n\(array)")
			}
			j -= 1
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


//MARK： test

var arrayInt = [9,1,5,8,3,7,6,4,2];
swap_sort(array: &arrayInt)

print("\n-------------------------------\n")

arrayInt = [9,1,5,8,3,7,6,4,2];
bubble_sort(array: &arrayInt)
print("\n-------------------------------\n")

arrayInt = [2,1,3,4,6,5,7,8,9]
bubble_sort_pro(array: &arrayInt)
