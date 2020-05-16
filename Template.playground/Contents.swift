class Game {
    func initialize() { }
    func startPlay() { }
    func endPlay() { }
    
    func play()
    {
        initialize()
        startPlay()
        endPlay()
    }
}

class Football: Game
{
    override func initialize() {
        print("Futbol Başladı")
    }
    
    override func startPlay() {
        print("Maç Başladı")
    }
    
    override func endPlay() {
        print("Oyun Sona Erdi")
    }
}

var oyun = Football()
oyun.play()
