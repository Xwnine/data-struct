//: Playground - noun: a place where people can play

import UIKit





extension Int {
   static func loopN(n: Int) {
        for i in 1...n {
            print("\n ----------\(i)------------\n")
        }
        
        (1...n).map {
            print("\n ----------\($0)------------\n")
        }
    }
    
   static func recursive(n: Int) {
        if n > 0 {
            recursive(n: n-1)
            print("\n recursive: \(n)------------\n")
        }
        return
    }
    
    //总共执行了n+3次
    static func sum(n: Int) -> Int {
        let base = (1+n) * n / 2 //执行一次
        print("1 ~ N求和: \(base)") //执行一次
        return base//执行一次
    }
    
    //下面这个函数总共执行了 3n+3次
    static func lowSum(n: Int) -> Int {
        var sum = 0; //执行1次
        for i in 1...n { //执行了 n+1次
            sum += i //执行了n次
            print("1 ~ N求和: \(sum)") //执行n次
        }
        return sum //执行一次
    }
    
    static func lowerSum(n:Int) -> Int {
        var sum = 0, temp = 0 //执行一次：
        
        for i in 1...n { //执行n+
            for _ in i...n {
                temp += 1  //执行了 n*n次
                sum += temp //执行了n*n次
                print("1 ~ N求和: \(sum)") //执行n * n次
            }
        }
        return sum
    }
}

Int.loopN(n: 10)
Int.recursive(n: 20)
Int.sum(n: 20)


