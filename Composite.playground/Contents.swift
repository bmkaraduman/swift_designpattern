protocol Asker {
    var name: String { get set }
    var kills: Int { get set }
    
    func move(x: Int, y: Int)
    func shoot(x: Int, y: Int)
    
    func addAsker(_ asker: Asker)
    func removeAsker(_ asker: Asker)
    
    func find(_ name: String) -> Asker?
}

class Piyade: Asker
{
    var name: String
    var kills: Int
    
    init(name: String, kills: Int) {
        self.name = name
        self.kills = kills
    }
    
    func move(x: Int, y: Int) {
        print("\(name) \(x) ve \(y) yönüne doğru  içtimaya gidiyor")
    }
    
    func shoot(x: Int, y: Int) {
        self.move(x: x, y: y)
        print("\(name) \(x) ve \(y) yönüne doğru  ateş etti")
        self.kills += 1
    }
    
    func addAsker(_ asker: Asker) {
        print("I don't permissions")
    }
    
    func removeAsker(_ asker: Asker) {
        print("I don't permissions")
    }
    
    func find(_ name: String) -> Asker? {
        if name == self.name {
            return self
        } else {
            return nil
        }
    }
}

class Commander: Asker
{
    var kills: Int
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    private var askerler: [Asker] = []
    
    func move(x: Int, y: Int) {
        self.askerler.forEach { $0.move(x: x, y: y) }
    }
    
    func shoot(x: Int, y: Int) {
        self.askerler.forEach { $0.shoot(x: x, y: y) }
    }
    
    func addAsker(_ asker: Asker) {
        guard self.hasPlayer(asker) == false else { return }
        self.askerler.append(asker)
    }
    
    func removeAsker(_ asker: Asker) {
        if let idx = self.askerler.index(where: { $0.name == asker.name }) {
            self.askerler.remove(at: idx)
        }
    }
    
    func find(_ name: String) -> Asker? {
        if name == self.name {
            return self
        }
        else
        {
            return self.askerler.filter { $0.find(name) != nil}.first
        }
    }
    
    func hasPlayer(_ asker: Asker)->Bool
    {
        return self.askerler.contains{$0.name == asker.name}
    }
}

class Fleet
{
    var name: String
    var fleetCommander: Asker?
    
    init(name: String) {
        self.name = name
        self.fleetCommander = createFleetCommander()
    }
    
    private func createFleetCommander() -> Asker
    {
        let firstTeam = Commander(name: "Meto")
        firstTeam.addAsker(Asker(name: "Hasan", kills: 9))
        firstTeam.addAsker(Asker(name: "Murat", kills: 12))
        
        let secondTeam = Commander(name: "Meto2")
        secondTeam.addAsker(Asker(name: "Hasan2", kills: 19))
        secondTeam.addAsker(Asker(name: "Murat2", kills: 122)
        
        let thirdTeam = Commander(name: "Meto3")
        thirdTeam.addAsker(Asker(name: "Hasan3", kills: 92))
        thirdTeam.addAsker(Asker(name: "Murat3", kills: 132)
        
        let fourthTeam = Commander(name: "Meto4")
        fourthTeam.addAsker(Asker(name: "Hasan4", kills: 1))
        fourthTeam.addAsker(Asker(name: "Murat4", kills: 56)
        
        let rightBigTeam = Commander(name: "Kral1")
        rightBigTeam.addAsker(firstTeam)
        rightBigTeam.addAsker(secondTeam)
        
        
        let leftBigTeam = Commander(name: "Kral2")
        leftBigTeam.addAsker(thirdTeam)
        leftBigTeam.addAsker(fourthTeam)
        
        let fleetcommander = Commander(name: "Padisah")
        fleetCommander?.addAsker(rightBigTeam)
        fleetCommander?.addAsker(leftBigTeam)
        
        return fleetCommander
    }
    
    func moveFleet(x: Int, y: Int) {
        self.fleetCommander?.move(x: x, y: y)
    }
    
    func fleetFire(x: Int, y: Int) {
        self.fleetCommander?.shoot(x: x, y: y)
    }
    
    func move(playerName name: String, x: Int, y: Int) {
        self.fleetCommander?.find(name)?.move(x: x, y: y)
    }
    
    func fire(playerName name: String, x: Int, y: Int) {
        self.fleetCommander?.find(name)?.shoot(x: x, y: y)
    }
    
    func fleetStats() {
        print("FC kills: \(self.fleetCommander?.kills ?? 0)")
    }
    
    func stats(playerName name: String) {
        if let player = self.fleetCommander?.find(name) {
            print("[\(player.name)]: Kills - \(player.kills)")
        } else {
            print("No player with that name")
        }
    }
}

let fleet = Fleet(name: "Altın Armada")
fleet.moveFleet(x: 12, y: 12)
fleet.fleetFire(x: 13, y: 13)



