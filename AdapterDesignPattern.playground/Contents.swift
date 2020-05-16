protocol Hayvan {
    func UcarKacar()
    func YemekYer()
}

class bocek: Hayvan {
    func UcarKacar() {
        print("Uçtum Kaçtım")
    }
    
    func YemekYer() {
        print("Yemek Yedim")
    }
}

class insan {
    func Dusunur(){
        print("Dusunuyorum, öyleyse varım")
    }
}

func hayvanFunctions(hayvan: Hayvan)
{
    hayvan.UcarKacar()
    hayvan.YemekYer()
}

class insanAdapter: Hayvan {
    private var newInsan: insan
    
    init(insan2: insan) {
        self.newInsan = insan2
    }
    
    func UcarKacar() {
        newInsan.Dusunur()
    }
    
    func YemekYer() {
        
    }
}

let ugurBocek = bocek()
hayvanFunctions(hayvan: ugurBocek)

let insannn = insan()

let insan3 = insanAdapter(insan2: insannn)
hayvanFunctions(hayvan: insan3)
