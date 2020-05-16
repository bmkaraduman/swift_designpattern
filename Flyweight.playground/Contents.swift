print("naber")

protocol Human
{
    var gender: Gender { get }
    func createHuman()
}

enum Gender
{
    case man
    case woman
}

class Insan: Human
{
    var gender: Gender = .man
    
    init(gender: Gender) {
        self.gender = gender
    }
    
    func createHuman() {
        print("Naber")
    }
}

class HumanFactory {
    var insanlar: [Gender: Human] = [Gender: Human]()
    
    func createHuman(gender: Gender) -> Human {
        if let human = insanlar[gender]
        {
            return human
        }
        else
        {
            let human = Insan(gender: gender)
            insanlar[gender] = human
            return human
        }
    }
}

let factory = HumanFactory()
let erkek = factory.createHuman(gender: .man)
erkek.createHuman()

let kadın = factory.createHuman(gender: .woman)
