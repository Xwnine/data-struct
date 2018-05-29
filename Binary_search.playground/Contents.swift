//: Playground - noun: a place where people can play

import UIKit

//给定N个从小到大排好序的整数序列List[]，以及某待查找整数X，我们的目标是找到X在List中的下标。即若有List[i]=X，则返回i；否则返回-1表示没有找到。
//
//二分法是先找到序列的中点List[M]，与X进行比较，若相等则返回中点下标；否则，若List[M]>X，则在左边的子系列中查找X；若List[M]<X，则在右边的子系列中查找X。




/*
    最优时间复杂度：O(1)
    最差时间复杂度：O(logN)
    空间复杂度：O(logN)
 
 */
/// 递归实现二分查找，如果目标元素在数列中，则返回目标元素在数列中的下标，如果不存在，则返回-1。
///
/// - Parameters:
///   - list: 有序数列
///   - target: 目标元素
///   - start: 查找其实位置
///   - end: 查找的结束位置
/// - Returns: 目标元素的下标
func binary_search(list: [Int], target: Int, start: Int, end: Int) ->Int {
    guard start < end else {
        return -1
    }
    
    //计算中点
    let mid = start + (end - start) / 2 ////直接平均可能会溢位，所以用此算法
    if list[mid] > target { //目标元素在中间元素的左边
       return binary_search(list: list, target: target, start: start, end: mid-1)
    }else if list[mid] < target {
        return binary_search(list: list, target: target, start: mid+1, end: end)
    }else {
        return mid
    }
}

/*
 最优时间复杂度：O(1)
 最差时间复杂度：O(logN)
 空间复杂度：O(1)
 
 */

/// while 循环实现二分查找
///
/// - Parameters:
///   - list: 有序数列
///   - target: 目标元素
///   - start: 查找的起始位置
///   - end: 查找的结束位置
/// - Returns: 目标元素的下标
func binary_search_while(list: [Int], target: Int, start: Int, end: Int) -> Int {
    guard start < end else {
        return -1
    }

    var ret: Int = 0, left = start, right = end
    while left <= right {
        //重新计算中点
        let mid = left + (right - left)/2
        if list[mid] > target {
            right = mid - 1 //调整右边界
        }else if list[mid] < target {
            left = mid + 1 //调整左边界
        }else {
            ret = mid //查找成功
            break
        }
    }
    return ret;
}

let list = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]

binary_search(list: list, target: 6, start: 0, end: list.count)
binary_search_while(list: list, target: 6, start: 0, end: list.count)


