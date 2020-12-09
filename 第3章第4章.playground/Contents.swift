import UIKit

//赋值运算符
//赋值元组
let (x1,y1) = (1,"元组元素2")
print("x1=\(x1),y1=\(y1)")

//加号(+)可以用来连接两个字符串
print("你好"+",年轻人")

//组合加(+=)运算符
var a = 1
a += 2
print(a)

//恒等运算符(===)和不恒等(!==运算符)
//表示两个对象是否引用同一个对象实例

//三元运算符
//swift中唯一的三元运算符
let value:Bool = true
var b = 3
b = value ?  1: 0
print(b)

//空合运算符:ex:(a??b)对可选类型a进行判空,如果a不等于空就解包a并返回a的值，否则返回b的值.a必须是可选类型(Object?)
var optValue:String? = nil
let otherValue = "blue"
var endValue = optValue ?? otherValue//注意空合运算符两边必需添加空格
print("\(endValue)")
//复习：a!对a进行解包，a必须要是可选类型，才能进行解包操作
//let testValue = 1
//print(testValue!)//这是错误的，必须要对可选类型进行解包

//区间运算符(a...b)
//闭区间
let qujian = 1...2//表示a(包含a)到b(包含b)的值
//半开区间
let biqujian = 1..<3//表示a(包含a)到b(不包含b)的值
//闭区间应用
for index in 0...5{
    print(index)
}
//半开区间应用
let names = ["a","b","c","d"]//定义数组
let count = names.count
for index in 0..<count{
    print("\(names[index])")
}

//---------------第四章---------------------
//字符串常量(双引号之间的字符串)
let str = "CONSTANT"
//初始化空字符串
let str2 = ""
let str3 = String()
//字符串可变性
var changeString = "Hello"
changeString += ",World"
print(changeString)
let notChangeString = "Hello"
//notChangeString += ",World"//引发编译错误,常量字符串

//使用字符
for char in "哈哈√"{
    print(char)
}

//Character类型(字符类型,注意需要使用双引号)
let char:Character = "字"
print(char)

//连接字符串
var string = "haha"
string += ",lixiaojun"
print(string)
string.append("，庞秋月")
print(string)

//字符串插入值
let strings = "字符串"
print("你好\(strings)")

//计算字符数量
let strResult = "你好,打工人"
print("strResult字符串的字符数量为:\(strResult.count)")

//字符串索引
let strs = "Swift"
print("\(strs)的开始索引为\(strs.startIndex.encodedOffset)")
print("\(strs)的结束索引为\(strs.endIndex.encodedOffset)")

//通过下标获取字符
let a1 = strs[strs.startIndex]
let strs2 = "haha"
//获取最后一个元素 TODO这里不是很理解调用
let a2 = strs2[strs2.index(before:strs2.endIndex)]

//遍历字符串下标
for indexs in strs.indices{
    print("\(indexs.encodedOffset),",strs[indexs])
}

//插入字符串
var strHello = "你好"
strHello.insert("!", at: strHello.endIndex)
strHello.insert(contentsOf: "李晓军", at: strHello.endIndex)

//删除字符
let result:Character = strHello.remove(at: strHello.startIndex)
print("\(result),删除后的字符串为\(strHello)")

//比较字符串
var strA = "abc"
var strB = "abc"
var strC = "bcd"
if strA == strB {
    print("strA等于strB")
}else{
    print("strA不等于strB")
}

//比较字符串前缀是否相等
if strA.hasPrefix("a") {
    print("字符串strA含有字符a")
}

if strA.hasSuffix("c"){
    print("字符串strA含有后缀c")
}
