import UIKit

class player{
    let NO:String = "24"
    var score:Int = 60
}

let kobe = player()
print("\(kobe.NO),\(kobe.score)")
kobe.score = 80
print("\(kobe.score)")

//延迟存储属性
class map{
    var place = "死亡沙漠"
}

class role{
    lazy var battleMap = map()//这里并没有执行创建
    var online = true
}

let master = role()//这里使用时才创建实际对象

print("法师到了\(master.battleMap.place)")

//计算属性
struct Rectangle{
    var width = 0
    var height = 0
    var area:Int{
        get{
            return width * height
        }
        set{
            //set如果没有显示设置参数，默认为newValue
            
        }
    }
}

struct RectangleReadOnly{
    //只读属性，如果尝试给area设置值，会导致编译错误
    var area:Int{
        return 100
    }
}

var rectangle = Rectangle()
rectangle.width = 10
rectangle.height = 10
print("rectangle的area=\(rectangle.area)")
rectangle.area = 200
print("rectangle的area=\(rectangle.area)")

//属性观察期
class Calculator{
    var value:Int = 0{
        willSet{
            print("值即将被设置，被设置的值为:\(newValue),这个回调将会在新值设置之前调用")
        }
        didSet{
            print("值已经被设置，这会在值设置完成之后马上调用，旧值为:\(oldValue)")
        }
    }
}

var calculator = Calculator()
calculator.value = 10

//全局变量和局部变量

//静态变量（和java类似）
class Person{
    static var name = "lixiaojun"
}

Person.name = "Pangqiuyue"

print("Person.name=\(Person.name)")

//实例方法
class Teacher{
    var name:String = "老师"
    func getName()->String{
        return name
    }
}

var teacher = Teacher()
print("teacher.name=\(teacher.getName())")

//使用struct中的实例方法
struct TeacherStruct{
    var name:String = "老师结构体"
    //结构体中必须要加上mutating关键字，否则不能使用实例.方法名来调用，会导致编译错误
    mutating func setName(name:String){
        //访问结构体中的成员需要使用self关键字
        self.name = name
    }
}

var teacherStruct = TeacherStruct()
teacherStruct.setName(name: "李晓军结构体")
print("teacherStruct.name=\(teacherStruct.name)")

//使用枚举中定义的实例方法
//和在结构体中使用实例方法注意事项一致：
//1.方法必须要加上mutating 2.调用自己的属性必须加上self关键字

//静态方法
class PersonClass{
    static var name:String = "随便一个名字"
    //通过使用关键字class或者static定义一个静态方法
    class func getStringFromInt(value:Int)->String{
        return String(value)
    }
    static func getStringFromDouble(value:Double)->String{
        return String(value)
    }
    
    class func setName(name_:String){
        name = name_
    }
    
}

print("\(PersonClass.getStringFromInt(value: 10))")
print("\(PersonClass.getStringFromDouble(value: 10.2))")
PersonClass.setName(name_: "哈哈名字")
print("\(PersonClass.name)")

//Struct中的静态方法和类的规则一样
