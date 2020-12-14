import UIKit

func sayHello(personName:String)->String{
    let say = "你好,\(personName)"
    return say
}

print(sayHello(personName: "庞秋月"))

func getMoney(salary:Int,shui:Int)->Int{
    return salary - shui
}

print("个人所得为\(getMoney(salary: 11500, shui: 2000))")

func sayHello()->String{
    return "Hello,man"
}

print("\(sayHello()))")

print(sayHello())

func HiMan(name:String){
    print("你好啊,"+name)
}

HiMan(name:"庞秋月")

func findMaxAndMin(array:[Int])->(min:Int,max:Int){
    var max = array[0]
    var min = array[0]
    for value in array{
        if value > max {
            max = value
        }
        if value < min {
            min = value
        }
    }
    return (min,max)
}

let array = [1,2,5,2,3,8,19,55]

let value = findMaxAndMin(array: array)

print("找出最大数\(value.1),找到的最小数为\(value.0)")

func getMinMaxMoney(array:[Int])->(min:Int,max:Int)?{
    if array.isEmpty{
        return nil
    }
    var min = array[0]
    var max = array[0]
    for value in array{
        if value < min{
            min = value
        }
        if value > max{
            max = value
        }
    }
    return (min,max)
}

var arrays = [Int]()
arrays = [8000,9000,7000]

arrays = []

//使用可选绑定来输出工资
if let salary = getMinMaxMoney(array: arrays) {
    print("最少工资是\(salary.min),最多工资是\(salary.max)")
}else{
    print("你输入的工资为空，我认为你没有工资")
}

//外部参数名和局部参数名(外部参数名 局部参数名:参数类型)

func join(string s1:String,toString s2:String,withJoiner joiner:String)->String{
    return s1+s2+joiner
}

print(join(string: "参数1", toString: "参数2", withJoiner: "参数3"))

//函数默认参数
func isStudent(姓名 name:String,年龄 age:Int = 22)->Bool{
    print("姓名:\(name)")
    if age > 22 {
        print("不是学生")
        return false
    }
    else{
        print("是学生")
        return true
    }
}

isStudent(姓名: "李晓军")

func showNumbers(numbers:Int...){
    for value in numbers {
        print("传入了number=\(value)")
    }
}

showNumbers(numbers: 1,2,3)

//变量参数，不知道为什么，var关键字不能用在参数列表里面，会被当成参数别名，可能是swift5取消了？？？？
//func alignRight(var string:String,totalLength:Int,pad:Character)->String{
//    let amountToPad = totalLength - string.count
//    if amountToPad < 1 {
//        return string
//    }
//    let padString = String(pad)
//    var rtStr = string
//    for _ in 1...amountToPad{
//        rtStr = padString + rtStr
//    }
//    return rtStr
//}
//let originalString = "hello"
//
//var varString = "heelo"
//
//print(alignRight(string: varString, totalLength: 10, pad: "-"))

// inout关键字
func swap2Ints(a:inout Int,b:inout Int){
    let temp = a
    a = b
    b = temp
}

var a = 1
var b = 2

print("通过函数修改前,a=\(a),b=\(b)")

swap(&a, &b)

print("通过函数修改后,a=\(a),b=\(b)")

//函数类型
func add(a:Int,b:Int)->Int{
    return a + b
}

func cheng(a:Int,b:Int)->Int{
    return a * b
}

var funcTypeAdd:(Int,Int)->Int = add
var funcTypeCheng:(Int,Int)->Int = cheng(a:b:)

print(funcTypeAdd(1,2))

print(funcTypeCheng(1,2))

//将函数作为函数的参数
func showMultipy(a:Int,b:Int,multipy:(Int,Int)->Int){
    let result = multipy(a,b)
    print("a*b=\(result)")
}
showMultipy(a: 2, b: 3, multipy: funcTypeCheng)

//返回函数类型
func addOne(number:Int)->Int{
    return number+1
}

func minusOne(number:Int)->Int{
    return number-1
}

func isAddOrMinus(param:Bool)->(Int)->Int{
    return param ? addOne:minusOne
}

print("isAddOrMinus=\(isAddOrMinus(param: true)(10))")

//嵌套函数：在函数中定义函数
func outFunc(){
    print("外部函数被调用")
    func inFunc(){
        print("内部函数被调用")
    }
    inFunc()
}

outFunc()


//传递闭包的普通方式，以sorted函数为例
let city = ["zhuhai","guangzhou"]
func backward(s1:String,s2:String)->Bool{
    return s1 > s2
}
var newCity1 = city.sorted(by: backward(s1:s2:))

print("newCity1=\(newCity1)")

//传递闭包表达式(个人理解为匿名闭包)
var newCity2 = city.sorted(by: {
    (s1:String,s2:String)->Bool in
    return s1 > s2
})

print("newCity2:\(newCity2)")

//根据上下文推断
var newCity3 = city.sorted(by: {
    s1,s2 in
    return s1 > s2
})

print("newCity3=\(newCity3)")

//单表达式闭包省略返回关键字
var newCity4 = city.sorted(by: {
    s1,s2 in s1 > s2
})

print("newCity4=\(newCity4)")

//参数名称缩写
var newCity5 = city.sorted(by: {
    $0 > $1
})

//运算符函数（String类型定义了运算符>的字符串实现，和sorted要求的闭包的形式一模一样）
var newCity6 = city.sorted(by: >)

//挂尾闭包（如果闭包是最后一个函数参数，可以省略()小括号，这和kotlin一样）省略

//闭包的值捕获（会捕获上下文(外层函数)的常量和变量）
func makeIncrementer(forIncrement amount:Int)->()->Int{
    var runningTotal = 0
    func incrementer() -> Int{
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let functionType =  makeIncrementer(forIncrement: 10)
print(functionType())
print(functionType())
//输出20

//闭包是引用类型
