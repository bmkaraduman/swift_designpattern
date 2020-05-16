protocol createHuman {
    var gender: Gender { get set }
    func create()
}

class man: createHuman {
    var gender: Gender = .man
    
    func create() {
        print("Created \(gender)")
    }
}

class woman: createHuman {
    var gender: Gender = .woman
    func create() {
        print("Created \(gender)")
    }
}

enum Gender {
    case man
    case woman
}

class HumanFactory {
    //Singleton
    private static var sharedHumanFactory = HumanFactory()
    
    class func shared()->HumanFactory {
        return sharedHumanFactory
    }
    
    func getHuman(gender: Gender) -> createHuman {
        switch gender {
        case .man:
            return man()
        case .woman:
            return woman()
        }
    }
}

let created_man = HumanFactory.shared().getHuman(gender: .man)
created_man.create()

let created_woman = HumanFactory.shared().getHuman(gender: .woman)
created_woman.create()
