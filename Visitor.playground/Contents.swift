protocol PhoneVisitor {
    func visit(_ model: Iphone7)
    func visit(_ model: Iphone8)
}

protocol Phone {
    func call(str: String)
    func addModule(_ module: PhoneVisitor)
}

class Touch3D: PhoneVisitor {
    func visit(_ model: Iphone7) {
        print("IPhone 7 naber")
    }
    
    func visit(_ model: Iphone8) {
        print("IPhone 8 naber")
    }
}

class DoubleCamera: PhoneVisitor {
    func visit(_ model: Iphone7) {
        print("IPhone 7 naber")
    }
    
    func visit(_ model: Iphone8) {
        print("IPhone 8 naber")
    }
}

class Iphone7: Phone
{
    func call(str: String) {
        print("IPhone 7 called")
    }
    
    func addModule(_ module: PhoneVisitor) {
        print("IPhone 7 added")
    }
    
    
}

class Iphone8: Phone {
    func call(str: String) {
        print("IPhone 8 called")
    }
    
    func addModule(_ module: PhoneVisitor) {
        print("IPhone 8 added")
    }
}

let iphone7 = Iphone7()
iphone7.call(str: "0000 000")

let iphone8 = Iphone8()
iphone8.call(str: "34234 23234")

let touchModule = Touch3D()
let doubleCamera = DoubleCamera()
iphone7.addModule(touchModule)
iphone8.addModule(doubleCamera)
