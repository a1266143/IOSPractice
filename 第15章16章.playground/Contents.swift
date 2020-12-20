import UIKit

//存储属性必须要设置初始值，和java不一样，java类中的属性随着类型不同，有默认的初始值，但是swift中，必须要显式地赋初值
//如果不赋初值，就必须在构造方法里面初始化
class Person{
    var age:Int = 24
    var name:String
    init(personName name:String){
        self.name = name
    }
    //自定义构造方法
    init(age:Int){
        self.age = age
        self.name = "FuckMan"
    }
}

let person = Person(personName: "李晓军")
print("person的姓名为:\(person.name),年龄为:\(person.age)")
let person2 = Person(age:10)
print("person2的姓名为:\(person2.name),年龄为:\(person2.age)")

//类的默认构造函数
class ShopCar{
    var name:String?
    var number = 0
    var isPurchased = false
}

//结构体的默认构造函数,和类不一样，可以初始化
struct ShopCarStruct{
    var name:String
    var number:Int
    var isPurchased:Bool
}

let shopCar = ShopCar()
let shopCarStruct = ShopCarStruct(name: "肥皂", number: 1, isPurchased: true)

print("购物车类，名称=\(shopCar.name),数量=\(shopCar.number),是否购买=\(shopCar.isPurchased)")
print("购物车结构体,名称=\(shopCarStruct.name),数量=\(shopCarStruct.number),是否购买=\(shopCarStruct.isPurchased)")

//值类型(struct)的初始化和构造函数代理
struct Student{
    var name:String = "没有姓名"
    var age:Int = 0
    //构造函数1
    init(){
        print("默认构造函数")
    }
    //构造函数2
    init(_ name:String,_ age:Int){
        self.name = name
        self.age = age
    }
    //构造函数3
    init(isBoy boy:Bool){
        self.init("没有姓名",0)
        if boy {print("男孩子")} else {print("女孩子")}
    }
}

let student = Student(isBoy: true)
print("学生姓名:\(student.name),年龄:\(student.age)")

//类类型的构造函数不能直接进行代理调用构造函数
//指定构造函数和便利构造函数
class MyClass{
    var variable:String
    //指定构造函数
    init(){
        variable = "String"
    }
    
    //便利构造函数,必须调用指定构造函数，便利构造函数只是一个辅助作用(??????)
    convenience init(variable:String){
        //这里需要注意的是：便利构造函数必须先调用本来的其它指定构造函数，才能继续使用自己的其它参数
        self.init()
        self.variable = variable
    }
    
}

let myClass = MyClass(variable: "what")
print("调用便利构造函数的myClass中的variable=\(myClass.variable)")

//指定构造函数中必须调用父类的指定构造函数
class FatherClass{
    var name:String
    //定义一个指定构造函数
    init(name:String){
        self.name = name
    }
    //第二个构造函数想要调用第一个构造函数，必须指定为convenience辅助函数
    //这里需要注意的是：便利构造函数必须先调用本来的其它指定构造函数，才能继续使用自己的其它参数
    convenience init(name:String,age:Int){
        self.init(name:name)
        print("你输入了年龄:\(age)")
    }
}

class SonClass:FatherClass{
    var mSonName:String
    //定义指定构造函数
    init(fatherName name:String,sonName:String){
        self.mSonName = sonName
        //必须调用父类的指定构造函数,这里还要注意一点是：必须先初始化本类的成员，再调用super.init初始化父类
        super.init(name: name)
    }
}

let sonClass = SonClass(fatherName: "liguangwei", sonName: "lixiaojun")
print("SonClass的父亲姓名为:\(sonClass.name)，自己的名字为:\(sonClass.mSonName)")
