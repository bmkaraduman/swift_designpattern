protocol car {
    func drive()
}

class sedan: car {
    func drive() {
        print("Sedan Araba Sürüyorum")
    }
}

class HBack: car {
    func drive() {
        print("HBack araba sürüyorum")
    }
}

class ModelSedanOld: sedan {
    override func drive() {
        print("2008 Model Araba Sürüyor...")
    }
}


protocol ModelCar {
    var model_car: car { get set }
    func drive()
}

class ModelSedan2: ModelCar {
    var model_car: car
    init(car: car) {
        self.model_car = car
    }
    
    func drive() {
        model_car.drive()
        print("drive")
    }
}

let sedanAraba = sedan()
let ModelSedanYap = ModelSedan2(car: sedanAraba)
ModelSedanYap.drive()
