//: Playground - noun: a place where people can play


import Foundation

/// 连续子序列的最大子序列和 时间复杂度是O(n²),空间复杂度是O(n²)
///
/// - Parameters:
///   - seq: 给定连续子序列
/// - Returns: 最大子序列和，负数则返回0

func maxSequence(seq: [Int]) -> Int{
    var thisSum = 0, maxSum = 0
    
    for temp in 0 ..< seq.count { //子列左端位置
        thisSum = 0 //A[i] 到A[j] 子列和
        for subTemp in temp ..< seq.count {
            thisSum += seq[subTemp] //A[j] 到A[k]的和
        }
        if thisSum > maxSum {
            maxSum = thisSum
        }
    }
    print("序列最大和： \(maxSum)")
    return maxSum
}


/// 连续子序列的最大子序列和 时间复杂度是O(logN),空间复杂度是O(logN)
///
/// - Parameters:
///   - seq: 给定连续子序列
///   - left: 起始位
///   - right: 结束位
/// - Returns: 最大子序列和，负数则返回0

func maxSequencePro(seq:[Int], left: Int, right: Int) -> Int {
    if left == right {
        return seq[left] > 0 ? seq[left] : 0
    }
    
    let midle = left + (right - left)/2
    var leftMax = 0, rightMax = 0, temp = 0
    
    //求出左边最大的和
    for left in (left ... midle).reversed() {
        temp += seq[left]
        if temp > leftMax {
            leftMax = temp
        }
    }
    temp = 0
    //求出右边最大的和
    for right in midle+1 ... right {
        temp += seq[right]
        if temp > rightMax {
            rightMax = temp
        }
    }
    
    return max3(a: leftMax+rightMax, b: maxSequencePro(seq: seq, left: left, right: midle), c: maxSequencePro(seq: seq, left: midle+1, right: right))
}


/// 连续子序列的最大子序列和 时间复杂度是O(n),空间复杂度是O(n)
///
/// - Parameters:
///   - seq: 给定连续子序列
///   - left: 起始位
///   - right: 结束位
/// - Returns: 最大子序列和，负数则返回0
func mySequenceMax(seq:[Int], left: Int, right: Int) ->Int {
    if left == right {
        return seq[left]
    }
    
    let center = left + (right - left)/2
    //左边最大的和
    let leftMax = mySequenceMax(seq: list, left: left, right: center)
    //右边最大的和
    let rightMax = mySequenceMax(seq: list, left: center+1, right: right)
    //左边界的和
    var leftBorder = 0, rightBorder = 0, temp = 0
    for base in (left...center).reversed() { //从右到左开始累加
        temp += list[base]
        if  temp > leftBorder {
            leftBorder = temp
        }
    }
    
    temp = 0
    //右边界的和
    for base in center+1 ... right {
        temp += list[base]
        if temp > rightBorder {
            rightBorder = temp
        }
    }
    return max3(a: leftMax, b: rightMax, c: leftBorder+rightBorder)
}


/// 动态规划实现求连续子序列的最大子序列和 时间复杂度是O(n),空间复杂度是O(n)
///
/// - Parameters:
///   - seq: 连续子序列
/// - Returns: 返回值 如果最大和为负数，则返回0
func advanceSequenceMax(seq:[Int]) -> Int {
    if seq.count < seq.count {
        return 0
    }
    
    var thisSum = 0, maxSum = 0
    for index in 0 ..< seq.count {
        thisSum += seq[index] //先向后累加
        if thisSum > maxSum {
            maxSum = thisSum //更新最大值
        }else if thisSum < 0 {
            thisSum = 0 //置0
        }
    }
    return maxSum
}


///   求在给定连续区间上所有子序列的最大和 时间复杂度是 O(n), 空间复杂度是O(n)
///
/// - Parameters:
///   - seq: 连续整数序列
///   - startIndex: 指定初始位置
///   - endIndex: 指定结束位置
/// - Returns: 连续区域的子序列和，为负数则返回0
func sequenceSum(seq:[Int], startIndex: Int, endIndex: Int) -> Int {
    if startIndex == endIndex{
        return seq[startIndex]
    }
    var temp = 0 ,maxSum = 0
    for index in startIndex...endIndex {
        temp += seq[index]
        if maxSum < temp {
            maxSum = temp
        }
    }
    return maxSum
}

//求3个数的最大值
func max3(a: Int, b: Int, c: Int) -> Int {
    let temp = a > b ? a : b
    return temp > c ? temp : c
}


//MARK: 测试
let list = [-2,11,8,-4,-1,16,5,1]
//sequenceSum(seq: list, startIndex: 1, endIndex: 7)
//advanceSequenceMax(seq: list)
//maxSequence(seq: list)
//maxSequencePro(seq: list, left: 0, right: list.count-1)
//mySequenceMax(seq: list, left: 0, right: list.count-1)

