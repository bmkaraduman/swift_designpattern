protocol Canlı {
    var gender: Gender { get set }
    
    func create()
}

enum Gender
{
    case erkek
    case bayan
}

class Insan: Canlı
{
    var gender: Gender = .bayan
    
    init(cinsiyet: Gender) {
        self.gender = cinsiyet
    }
    
    func create() {
        print("\(gender) oluşturuldu")
    }
}

final class YetenekA: Canlı
{
    var gender: Gender
    
    private var insan: Insan
    
    init(insan: Insan) {
        self.gender = insan.gender
        self.insan = insan
    }
    
    func create() {
        print("Ezberleme Eklendl")
        insan.create()
    }
}

let kadinOlustur = Insan(cinsiyet: .bayan)
kadinOlustur.create()

let yetenekA = YetenekA(insan: kadinOlustur)
yetenekA.create()
