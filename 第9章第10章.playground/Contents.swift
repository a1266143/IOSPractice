import UIKit

//使用case关键字定义枚举
enum COLOR{
    case RED
    case YELLOW
    case GREEN
}

//调用枚举
print("RED为\(COLOR.RED)")

var color = COLOR.GREEN

switch color {
case COLOR.RED:
    print("红色")
case .GREEN:
    print("绿色")
default:
    print("啥也不是")
}

//枚举关联值
enum Barcode{
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var goods = Barcode.UPCA(8, 8, 8, 8)

goods = Barcode.QRCode("哈哈")

//switch语句的值绑定：将匹配的值绑定到一个临时的常量或者变量，这些常量或变量在该case分支里就可以被引用了
switch goods {
case let .UPCA(system, man, ggg, jiaoyan):
    print("一维码:system=\(system),man=\(man),ggg=\(ggg),jiaoyan=\(jiaoyan)")
case let .QRCode(二维码):
    print("二维码:\(二维码)")
}

//枚举原始值
enum planet:Int{
    case 水星=1
    case 金星
    case 地球
    case 火星
    case 木星
    case 土星
    case 天王星
    case 海王星
    case 冥王星
}

print(planet.水星.rawValue)
print(planet.冥王星.rawValue)
print(planet.天王星.rawValue)
print(planet.天王星.hashValue)

struct weapon{
    var name = ""
    var hitRate = 0.0
    var attack = 0
}

class Player {
    var name = ""
    var hp = 0
    var profession = ""
    var sabre = weapon()
}

var 青龙刀 = weapon()//注意，结构体是值类型
var 关小羽 = Player()//类是引用类型






