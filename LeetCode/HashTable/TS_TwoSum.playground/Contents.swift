//: Playground - noun: a place where people can play

import UIKit

var str = "Two Sum"


func twoSum(_ nums:[Int], _ target:Int) -> [Int] {
    
    let tmpSet = NSSet()
    var result:[Int] = [Int]()
    for base in nums {
        if tmpSet.contains(target-base) {
            result.append(nums.index(of: base)!)
            result.append(nums.index(of: target-base)!)
            break
        }
        tmpSet.adding(base)
    }
    return result
}

let nums = [2,7,15,9]
twoSum(nums, 9)




