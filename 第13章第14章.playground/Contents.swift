import UIKit

//定义下标
class Person{
    //定义下标
    subscript (index:Int)->Int{
        get{
            return index*10
        }
        set(newValue){
        }
    }
}
//访问下标
var person = Person()
print("\(person[10])")

//字典
var dic:Dictionary = ["key1":"door1","key2":"door2"]

print("dic:\(dic["key2"])")

for (key,value) in dic{
    print("key=\(key),value=\(value)")
}

//数组类型
var intArray:[Int] = [1,2,3]
for value in intArray{
    print("value=\(value)")
}

var strArray:[String] = ["1","2","3"]

//下标脚本：通过一个Matrix矩阵来说明
class Matrix{
    var rows,columns:Int
    
    var grid:[Int]
    
    init(rows:Int,columns:Int) {
        self.rows = rows
        self.columns = columns
        self.grid = Array(repeating: 0, count: rows*columns)
    }
    
    func indexIsValid(row:Int,column:Int) -> Bool {
        return row>=0&&row<rows&&column>=0&&column<columns
    }
    
    //定义下标
    subscript(row:Int,column:Int)->Int{
        get{
            assert(indexIsValid(row: row, column: column))
            return grid[(row*columns)+column]
        }
        set{
            assert(indexIsValid(row: row, column: column))
            grid[(row*columns)+column] = newValue
        }
    }
    
}

//创建一个3*3的矩阵
var matrix = Matrix(rows: 3, columns: 3)
matrix[0,0] = 1
matrix[0,1] = 2
matrix[0,2] = 3

//复习：属性观察期
class Student{
    
    init(){
        self.name = "xioajun"
    }
    
    var name:String{
        willSet{
            print("name即将被设置，newValue=\(newValue)")
        }
        didSet{
            print("name已经被设置,oldValue=\(oldValue)")
        }
    }
}

var student:Student = Student()
student.name = "lixiaojun2"

//继承：可以为继承来的属性添加 "属性观察器"

class Father{
    var name:String
    var age:Int
    
    init(name:String,age:Int){
        self.name = name
        self.age = age
    }
    
    func eat(number:Int){
        print("父亲吃饭了\(number)碗饭")
    }
}

class Son:Father{
    lazy var father:Father = Father(name:"李光伟",age:50)
    
    init(name:String="lixiaojun",age:Int=29,father fa:Father){
        super.init(name: name, age: age)
        self.father = fa
    }
    
    override func eat(number: Int) {
        super.eat(number: 1)
        print("父亲姓名:\(father.name),父亲年龄:\(father.age)")
        print("儿子吃了\(number)碗饭")
        print("儿子姓名:\(name),儿子年龄:\(age)")
    }
}


let father = Father(name:"李光伟",age:50)
let son = Son(father: father)
son.eat(number:2)


class People{
    
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
    
    var name:String
    var age:Int
    final var variableFinal:Int
    
    var description:String{
        return "姓名为\(name),年龄为\(age)的人类"
    }
}

var anyPeople = People(name:"李晓军",age:29)
func test()->Void{
    print(anyPeople.description)
}

test()

//final关键字，final修饰类，类不能被继承，final修饰变量或者方法，变量或方法不能被重写
class SubPeople:People{
    
    init() {
        
    }
    //不能重写final变量
    override var variableFinal:Int{
        return super.variableFinal+10
    }
}


