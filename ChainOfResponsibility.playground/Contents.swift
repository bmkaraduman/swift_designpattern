protocol Egitim
{
    func Donembitir(sinif: Int)
    var nextDonem: Egitim? { get set }
}


class LiseDonemi: Egitim
{
    var nextDonem: Egitim?
    
    func Donembitir(sinif: Int) {
        if sinif < 7
        {
            print("Liseye gidemezsiniz")
        }
        else
        {
            print("Lise Öğrencisisiniz")
            nextDonem?.Donembitir(sinif: sinif)
        }
    }
}

class UniversiteDonemi: Egitim
{
    var nextDonem: Egitim?
    
    func Donembitir(sinif: Int) {
        if sinif < 13
        {
            print("Üniversiteye gidemezsiniz")
        }
        else
        {
            print("Üniversite Öğrencisisiniz")
        }
    }
}

class Ilkogretim: Egitim
{
    var nextDonem: Egitim?
    
    func Donembitir(sinif: Int) {
        if sinif > 0 && sinif < 8
        {
            print("İlkokul Öğrencisisiniz")
        }
        else
        {
            nextDonem?.Donembitir(sinif: sinif)
        }
    }
}

var ilkogretim = Ilkogretim()
var lise = LiseDonemi()
var Universite = UniversiteDonemi()

ilkogretim.nextDonem = lise
lise.nextDonem = Universite

ilkogretim.Donembitir(sinif: 12)
ilkogretim.Donembitir(sinif: 18)
ilkogretim.Donembitir(sinif: 6)
