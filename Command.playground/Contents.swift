//NSInvocation

protocol car {
    func move()
}

class Sedan: car
{
    func move() {
        print("Sedan ist moving")
    }
}

class SUV: car
{
    func move() {
        print("SUV ist moving")
    }
}

class developer {
    let sedan = Sedan()
    let suv = SUV()
    func driveCar()
    {
        sedan.move()
    }
    
    func driveSuv()
    {
        suv.move()
    }
}


protocol command {
    func execute()
}

class movementCommand: command
{
    var cara: car
    init(mycar: car) {
        self.cara = mycar
    }
    func execute() {
        cara.move()
    }
}

class SDeveloper
{
    var scommand: command
    
    init(myCommand: command) {
        self.scommand = myCommand
    }
    
    func drive() {
        scommand.execute()
    }
}

let sedan = Sedan()
let sedanMovementCommand = movementCommand(mycar: sedan)
let suv = SUV()
let suvMovementCommand = movementCommand(mycar: suv)
let sdeveloper = SDeveloper(myCommand: sedanMovementCommand)
