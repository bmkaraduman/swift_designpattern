class Doly{
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func clone() -> Doly {
        return Doly(name: self.name)
    }
}

let protoType = Doly(name: "Benim Adım Doly")
print(protoType.name)
var kuzu1 = protoType.clone()
kuzu1.name = "Hakkı"
print(kuzu1.name)
var kuzu2 = protoType.clone()
kuzu2.name = "Ali"
print(kuzu2.name)
kuzu1 === kuzu2

