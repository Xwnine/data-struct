//: Playground - noun: a place where people can play

import UIKit


//线性表
/*
 ADT 线性表(List)
 Data
 线性表的数据对象集合为 { a1, a2, ......, an}，每个元素类型均为DataType
 其中，出去第一个元素之外，没个元素有且甚至有一个前驱元素，除最后一个元素外，每一个元素有且只有一个直接后继元素。
 数据元素之间的关系是一对一的关系。
 
 
 Operation:
 增、删、改、查（查元素、查下标）、初始化、销毁
 
 
 InitList(L):   初始化操作，建立一个空的线性表
 ListEmpty(L):  若线性表为空，返回true，否则返回false
 ClearList(L):  将线性表清空
 GetElem(L, i, e): 将线性表L中的第i个元素值返回给e
 LocateElem(L, e): 在线性表中去查与给定值e相等的元素，如果查找成功，返回该元素在表中的序号
 ListInsert(L, i, e): 在线性表中指定位置插入元素e
 ListDelete(L, i, e): 从线性表中删除指定位置的元素，并返回
 ListLength(L): 返回线性表L的元素个数
 
 endADT
 
 
 
 */

enum Status {
    case success, faliure(String)
}


//指定链表的能存储数据长度
let MAXSIZE = 20
//链表中的数据元素类型
typealias ElemType = Int

struct LinearSequnce<ElemType> {
    //线性表当前长度,也是当前线性表最后一个元素所在的位置
    var length:Int = 0
    //数组存储数据元素。数组元素的最大容量是maxsize
    var dataList:[ElemType] = Array(repeating: 0, count: MAXSIZE) as! [ElemType]
    
    //查找指定位置的元素
    static func element(list: LinearSequnce, loc: Int, element: inout ElemType) -> Status {
        guard loc < list.length || loc > 1 else { //数组越界
            return (Status.faliure("下标越界"))
        }
    
        if list.length == 0 {
            return (Status.faliure("链表数据为空"))
        }
        element = list.dataList[loc - 1]
        return (Status.success)
    }
    
    //查找指定元素的位置
    static func index(list: LinearSequnce, element: ElemType, loc: inout Int) -> Status {
        
        var i: Int = 0
    
        while i <= list.length {

            let temp = list.dataList[i]
//            if temp == element {
//                break
//            }
            i += 1
        }

        if i > list.length {
            loc = -1
            return Status.faliure("元素不存在")
        }
        loc = i
        return Status.success
    }
    

    //需要传入指针
    static func insert(list: inout LinearSequnce, loc: Int, element: ElemType) -> Status {
        guard list.length < MAXSIZE-1 else {
            return Status.faliure("表格数据已满")
        }
        
        guard loc < list.length + 1 || loc > 1 else {
            return Status.faliure("下标越界")
        }

        for index in (loc...list.length).reversed() { //从最后一个元素开始，顺序向后移动位置
            list.dataList[index + 1] = list.dataList[index]
        }
        //将新元素插入
        list.dataList[loc-1] = element
        //更新长度
        list.length += 1
        return Status.success
    }
    
     static func delete(list: inout LinearSequnce, loc: Int) -> Status {
        guard list.length > 0 else {
            return Status.faliure("线性表为空")
        }
        
        guard loc < list.length + 1 || loc > 1 else {
            return Status.faliure("下标越界")
        }
        
        for index in (loc+1...list.length) { //从i右边第一个元素开始，顺序向前移动位置
            list.dataList[index - 1] = list.dataList[index]
        }
        //更新长度
        list.length -= 1
        return Status.success
    }
}






