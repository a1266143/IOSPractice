import UIKit

//数值类型
8000
8_000//可以在整形添加下划线增加可读性
0003.1415//可以在浮点型数据前面增加0

//声明常量
let CONSTANT_VALUE = 1
//声明带类型的常量
let CONSTANT_VALUE2:Int = 2
//声明变量
var value = "String"

//注释

//多行代码写在一行上需要使用分号
let CONSTANT_VALUE3 = 3;let CONSTANT_VALUE4 = 4;


//整数
let value2:Int = 10

//浮点数
let value3:Double = 3.14159
let value4:Float = 1.234

//数值类型转换
let value5:Int = Int(value3)
let value6:Float = Float(value3)

//定义类型别名
typealias MyDouble = Double

let value7:MyDouble = 1.145

//Bool类型
let isTrue:Bool = true

//元组
let httpError = (400,"找不到网页")

print("errorCode=\(httpError.0),errorStr=\(httpError.1)")

//可选类型(可空类型)
let number = "0"
let isNumber = Int(number)
print("\(isNumber)")
print("\(isNumber!)")//拆包

//使用可选类型的绑定 <???没看懂,意思是下面这种句式叫绑定???>
if let isNumber2 = Int(number){
    print("是数字\(isNumber2)")
}else{
    print("不是数字")
}

//可选类型(可空类型)
let emptyString:String? = nil

print("\(emptyString)")

//感叹号用来表示reward说明可选类型(可空类型)是有值的
//TODO 这里暂时没搞明白感叹号(可选类型)和问号(可选类型)的区别
let reward:Int!
reward = 8_000
print("\(reward)")

//错误处理(书中内容较少，基本上属于没理解)
func hasError() throws{
    print("处理抛出错误")
}
try hasError()

//断言
let andyAge = 16
assert(andyAge > 18,"Andy的年龄未到18岁不允许喝酒")
