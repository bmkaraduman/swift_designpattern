protocol Human {
    var gender: Gender { get }
    var name: String { get }
}

protocol Animal {
    var gender: Gender { get }
    var name: String { get }
}

class HumanHome: Human {
    var gender: Gender = .man
    var name: String = "Default"
}

class Zoo: Animal {
    var gender: Gender = .man
    var name: String = "Default"
}

enum Gender {
    case man
    case woman
}

protocol AbstractFactory {
    func createHuman() -> Human
    func createAnimal() -> Animal
}

class Worldfactory: AbstractFactory {
    func createHuman() -> Human {
        print("Created Human")
        return HumanHome()
    }
    
    func createAnimal() -> Animal {
        print("Created Animal")
        return Zoo()
    }
}


var human: Human?
var animal: Animal?

human = Worldfactory().createHuman()
animal = Worldfactory().createAnimal()
