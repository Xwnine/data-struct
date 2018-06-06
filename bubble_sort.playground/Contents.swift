//: Playground - noun: a place where people can play

import UIKit

var str = "冒泡排序"



/// 交换函数
///
/// - Parameters:
///   - array: 数据
///   - i: 要交换的下标
///   - j: 要交换的下标
func swapInt(array: inout [Int], i: Int, j: Int) {
	let temp = array[i]
	array[i] = array[j]
	array[j] = temp
}


func bubble_sort_0(array: inout [Int]) {
	var i = 0, j = 0
	while i < array.count {
		j = i+1
		while j <= array.count {
			if array[i] < array[j] {
				swapInt(array: &array, i: i, j: j)
			}
			j += 1
		}
		i+=1
	}
}


func bubble_sort_1(array: inout [Int]) {
	var i=0, j=0
	while i<array.count {
		j = array.count-1
		while j >= i {
			swapInt(array: &array, i: i, j: j)
			j -= 1
		}
		i += 1
	}
}
