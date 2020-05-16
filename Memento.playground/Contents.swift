//Memento besteht aus Originator(Orginal Class - Copied oder Laden von diesem class), Memento und Caretaker

struct Dama {
    var level: Int
    var bolumAdi: String
    
    mutating func Kaydet() -> DamaMemento {
        return DamaMemento(level: self.level, bolumAdi: self.bolumAdi)
    }
    
    mutating func Reload(damaMemento: DamaMemento)
    {
        self.bolumAdi = damaMemento.bolumAdi
        self.level = damaMemento.level
    }
    
}


//Memento
struct DamaMemento {
    var level: Int
    var bolumAdi: String
}

//Caretaker
struct DamaCareTaker {
    var damaMemento: DamaMemento
}

var oyun1 = Dama(level: 4, bolumAdi: "12")
print("The Great Game name is \(oyun1.bolumAdi) and Level is \(oyun1.level)")

var taker = DamaCareTaker(damaMemento: oyun1.Kaydet())

oyun1 = Dama(level: 3, bolumAdi: "15")
print("The Great Game name is \(oyun1.bolumAdi) and Level is \(oyun1.level)")

oyun1.Reload(damaMemento: taker.damaMemento)
print("The Great Game name is \(oyun1.bolumAdi) and Level is \(oyun1.level)")





