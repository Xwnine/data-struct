//: Playground - noun: a place where people can play

import UIKit


extension Double {
    /// 计算给定任意点在多项式在给定点x处的值
    /// y = a0 + a1X + ..... anXn
    /// - Parameters:
    ///   - a: 系数数组[a0, a1,....,an]
    ///   - x: 点X的值
    ///   - n: 多项式的项数 比如 10项，n就为9
    /// - Returns: 计算结果
    static func calculate(a:[Double], x: Double, n: Int) -> Double {
        //先算第n项和an-1的和，所以先取出第n项的系数
        var sum: Double = a.last!
        for i in (1...n).reversed() {
            sum = a[i-1] + x * sum
        }
        print("多项式的和：\(sum)")
        return sum
    }
    
    //    //选择排序伪代码
    //
    //
    //
    //    func selectionSort(List: Sequence, N: Int) {
    //        for index in 0 ..< N {
    //            /*从List[i] 到List[N-1]中招最小元，并将其位置赋值给minPosition */
    //            let minPosition = ScanForMin(List: List, start: index, end: N-1)
    //            //将未排序部分的最小元换到有序部分的最后位置
    //            swap(&List[i], &List[])
    //        }
    //    }
    //
    //
    //    func ScanForMin(List:Sequence, start: Int, end: Int) -> Int {
    //        //截取数组。
    //
    //        //找到最小值的下标，并返回。C语言中可以使用指针的方式去获取地址，Swift中可以使用（value, index） 去遍历数组来取到最小值及其index，从而获取到元素对应的下标。另外 swift也有API实现根据value去取出index的API，时间复杂度是O(1)
    //
    //
    //
    //
    //
    //    }
    //
    //
}


let temp:[Double] = [1.3,3.5,5.6]
temp.index(of: 2.5)
Double.calculate(a: temp, x: 1.0, n: 2)



//多项式加法运算 使用不带头结点的单项链表，按照指数递减的形式排列各项。
/*
 1) P1.expon == P2.expon: 系数相加，若结果不是0，则作为结果多项式对应项的系数。同时，P1和P2都分别指向下一项
 2) P1.expon > P2.expon: 将P1的当前项存入结果多项式，并使P1指向下一项
 3) P1.expon < P2.expon: 将P2的当前项存入结果多项式，并使P2指向下一项
 
 */


//多项式使用链表表示
class PolynomialNode {
    var coef: Int //多项式系数
    var expon:Int //多项式指数
    var next: PolynomialNode?
    init(coef: Int = 0, expon: Int = 0) {
        self.coef = coef
        self.expon = expon
    }
}


class PolynomialList {
    typealias Node = PolynomialNode
    //头指针
    var first: Node?
    //当前结果多项式最后一项
    var rear: Node?
    
    init() {
        self.first = Node()
        self.rear = self.first
    }

    //是否为空
    var isEmpty: Bool {
        return first?.next == nil
    }
    
    //插入节点： 按照指数递减的形式排列各项
    func appendNode(node: Node) {
        //拼接节点
        rear?.next = node
        //同步节点的位置
        rear = node
        if isEmpty {
            first?.next = node
        }
    }
    //多项式加法
    
    class func add(p1: PolynomialList, p2: PolynomialList) {
        
        
        
    }
    
    //多项式乘法
    class func mult(p1: PolynomialList, p2: PolynomialList) {
        
    }
    
    //排序
    fileprivate func sort() {
    
    }
}


