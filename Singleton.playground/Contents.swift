class Singletontest
{
    private init() {
        
    }
    
    static let direct = Singletontest()
    var state = "Ankara"
    func CurrentState() {
        print("Current State is \(state)")
    }
    
   
    
}

//let singleTon1 = Singletontest()
//let singleTon2 = Singletontest()
////
//singleTon1 === singleTon2 // Result False

let singleTon1 = Singletontest.direct
let singleTon2 = Singletontest.direct

singleTon1 === singleTon2 //Result True
singleTon2.state
singleTon2.CurrentState()

