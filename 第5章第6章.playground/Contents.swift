import UIKit


//创建一个数组
var array = [String]()
print("array是一个字符串数组\(array)")
//通过数组构造函数创建数组
var arrayConstructor = [String](repeating: "重要的事情", count: 3)
print("\(arrayConstructor)")
//数组相加创建新的数组
let array1 = [String](repeating: "加班", count: 3)
let array2 = [String](repeating: "头秃", count: 2)
let arraySum = array1 + array2
print("\(arraySum)")

var busStations = ["创业路口站","二环路口站","科华南路站","新下街站"]
print("Bus公交站:\(busStations)")

if busStations.isEmpty {
    print("站点还未开通")
}else{
    print("站点已经开通,总共有\(busStations.count)个站")
}

print("现在需要添加一个站点,东景丽舍站")

busStations.append("东景丽舍站")

print("现在公交车站:\(busStations)")

print("现在需要在原先的二环路口站之前要添加一个站:一环路口站")

busStations.insert("一环路口站", at: 1)

print("现在的公交车站:\(busStations)")

print("现在开通了新的路线，需要添加两个站在末尾")

let endsStations = ["二胡街站","三户街站"]

busStations += endsStations

print("现在的公交车站路线为:\(busStations)")

print("由于创业路口站人口太少，所以决定将起始站改为春熙路站")

busStations[0] = "春熙路站"

print("现在的公交车站路线为:\(busStations)")

print("由于需求，需要将下标为1,2,3的三个站点换个名字")

//以区间的方式批量修改数组元素
busStations[1...3] = ["五环路口站","六环路口站","七环路口站"]

print("当前公交车路线为:\(busStations)")

print("现在根据公司要求，需要删除东景丽舍站")

busStations.remove(at: 5)

print("当前公交车路线为:\(busStations)")

print("现在需要删除最后一个站")

busStations.removeLast()

print("当前公交路线:\(busStations)")

//通过for循环打印出每个站
for (index,value) in busStations.enumerated(){
    print("第\(index+1)个站位\(value)")
}


//集的使用
var myNameSet = Set<String>()
//插入元素
myNameSet.insert("李晓军")
print("当前集的元素为:\(myNameSet)")
//将集置空
myNameSet = []
print("集:\(myNameSet)")

var zoom:Set<String> = ["牛","羊"]
var otherZoom:Set<String> = ["牛","羊"]
if zoom == otherZoom{
    print("两个动物园中的动物相同")
}
print("动物园是否为空:\(zoom.isEmpty)")
print("动物园的数量为:\(zoom.count)")

if zoom.contains("牛") {
    print("动物园里有牛")
}
if zoom.contains("老虎"){
    print("动物园里有老虎")
}else{
    print("动物园里没有老虎")
}

for animal in zoom {
    print("动物园里有:\(animal)")
}

let zoom1:Set<String> = ["人","🐅","🦁"]
let zoom2:Set<String> = ["人","🐴","🐑"]

let intersection = zoom1.intersection(zoom2)
print("zoom1和zoom2的交集为\(intersection)")

let symmericDifferences = zoom1.symmetricDifference(zoom2)
print("zoom1和zoom2的非交集的集为:\(symmericDifferences)")

let union = zoom1.union(zoom2)
print("zoom1和zoom2的并集为:\(union)")

let subtracting = zoom1.subtracting(zoom2)
print("zoom1在zoom2中的补集为:\(subtracting)")

var zoom3:Set<String> = ["马","牛"]

let zoom4:Set<String> = ["马","牛","羊"]

let zoom5:Set<String> = ["羊","老虎"]

if zoom3.isSubset(of: zoom4) {
    print("zoom3是zoom4的子集")
}

if zoom4.isSuperset(of: zoom3) {
    print("zoom4是zoom3的父集")
}

if zoom3.isDisjoint(with: zoom5) {
    print("zoom3和zoom5没有任何一个动物相同")
}

zoom3.remove("马")
print("zoom3=\(zoom3)")

//字典

var airport1:[Int:String] = [1:"新加坡机场",2:"双流机场"]
var airport2:[Int:String] = [1:"美国机场",2:"万源机场"]
if !airport1.isEmpty{
    print("飞机场airport1有机场的")
    print("airport1有\(airport1.count)个飞机场")
}

//修改飞机场
airport1[1] = "广州机场"

print("airport1机场:\(airport1)")
//更新value
let result = airport1.updateValue("新机场", forKey: 1)
print("修改前的机场:\(result),修改后的机场:\(airport1)")
//删除机场
let jichang = airport1.removeValue(forKey: 1)
print("被删的机场:\(jichang)")
print("剩下的机场为:\(airport1)");
if airport1.removeValue(forKey: 3) == nil {
    print("不存在key=3的机场")
}

//迭代输出key
for key in airport1.keys{
    print("迭代key=\(key)")
}

//迭代输出value
for value in airport1.values{
    print("迭代value="+value)
}

//迭代key和value
for (key,value) in airport1{
    print("key=\(key)"+",value="+value)
}

//将keys转换成数组
let keysArray = Array(airport1.keys)
let valuesArray = Array(airport1.values)
print("keysArray=\(keysArray)")
print("valueArray=\(valuesArray)")

//-----------------------第6章----------------------------------
//for-in语句：用来遍历 数组 区间 序列 集合
var myArray = ["李晓军","庞秋月"]
for name in myArray{
    print("名字为:\(name)");
}
//循环1到5区间的数
for index in 1...5{
    print("index=\(index)")
}
//循环集Set
let mySet:Set<String> = ["集合元素1","集合元素2"]
for value in mySet{
    print("元素值为:"+value)
}
//循环字典
let myDictionary:Dictionary<Int,String> = [1:"打野",2:"中单"]
for (index,value) in myDictionary{
    print("index=\(index),value=\(value)")
}
//如果不需要对for-in循环中的value访问,可以使用_来忽略
for _ in 1...5{
    print("重要的事情")
}

//for条件递增
for index in stride(from: 0, to: 3, by: 1){
    print("index is \(index)")
}

//while循环
var startIndex = 1
let endIndex = 5
var count = 0
while startIndex < endIndex {
    startIndex += 1
    count += 1
    print("count=\(count)")
}
//repeat-while (do-while)
var begin = 0
var end = 5
repeat{
    begin += 1
    print("what")
}while begin < end

//if 语句
if true {
    print("true")
}

let beginValue = 10

if beginValue <= 0 {
    print("beginValue<=0")
}else if beginValue <= 10{
    print("beginValue<=10")
}else{
    print("beginValue>10")
}

let dic:Dictionary<String,String> = ["name":"李晓军"]
print("dic=\(dic["xiao"])")

//guard 语句，
func login(person:[String:String]){
    guard let name = person["name"] else {
        print("else语句")
        return
    }
    print("账号name= \(name)")
}

login(person:["what":"noValue","name":"李晓军"])

let animal = "gfdgsz"
switch animal {
case "猴子","马":
    print("猴子case")
case "人":
    print("人case")
default:
    print("啥玩意也不是")
}

//TODO 元组值绑定
var guess = ("大",5)//元组
switch guess {
case ("大",5):print("开大,5点")
default:
    print("开小,0点")
}

//元组值绑定
//值绑定:在这种Switch选择模式中，可以定义一个临时常量或者变量，并在之后的上下文语句中使用
//case 分⽀的模式允许将匹配的值绑定到⼀个临时的常量或变量，这些常量或变量在该
//case 分⽀⾥就可以被引⽤了——这种⾏为被称为值绑定（value binding）。
switch guess {
case (let x,5):print("值绑定的x=\(x)")
case ("",let y):print("值绑定y=\(y)")
default:
    print("default")
}

//使用where关键字
switch guess {
case (let x,let y) where y == 5:print("哈哈，模式匹配")
case (let x,let y) where x == "大":print("这里已经执行不到了")
default:
    print("啥也不是")
}

//continue语句
for index in 1...5{
    if index == 3 {
        continue
    }else{
        print("index=\(index)")
    }
}

//可选绑定
//使用可选绑定（optional binding）来判断可选类型是否包含值，如果包含就把值赋给一个临时常量或者变量。可选绑定可以用在if和while语句中来对可选类型的值进行判断并把值赋给一个常量或者变量。

//break语句
var intOpt:Int?
let a = 1
switch a {
case 1:
    intOpt = 10
default:
    break;
}

//使用可选绑定
if let intOptLet = intOpt {
    print("intOptLet=\(intOptLet)")
}

//fallthrough贯穿特性
let constant = 5
switch constant {
case 1,2:
    print("值是1,2")
    fallthrough
case 3,4:
    print("值是3,4")
    fallthrough
default:
    print("值是default")
}
