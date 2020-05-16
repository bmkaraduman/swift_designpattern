protocol Mediator {
    func send(message: String, sender: Colleague)
}

class TeamMediator: Mediator {
    var colleagues: [Colleague] = []
    func register(colleague: Colleague) {
        colleagues.append(colleague)
    }
    func send(message: String, sender: Colleague) {
        for colleague in colleagues {
            if colleague.id != sender.id {
                colleague.receive(message: message)
            }
        }
    }
}

protocol Colleague {
    var id: String { get }
    var mediator: Mediator { get }
    func send(message: String)
    func receive(message: String)
}

class Developer: Colleague {
    var id: String
    var mediator: Mediator
    init(mediator: Mediator) {
        self.id = "Developer"
        self.mediator = mediator
    }
    func send(message: String) {
        mediator.send(message: message, sender: self)
    }
    func receive(message: String) {
        print("Developer received: " + message)
    }
}

class QE: Colleague {
    var id: String
    var mediator: Mediator
    init(mediator: Mediator) {
        self.id = "QE"
        self.mediator = mediator
    }
    func send(message: String) {
        mediator.send(message: message, sender: self)
    }
    func receive(message: String) {
        print("QE received: " + message)
    }
}

class PM: Colleague {
    var id: String
    var mediator: Mediator
    init(mediator: Mediator) {
        self.id = "PM"
        self.mediator = mediator
    }
    func send(message: String) {
        mediator.send(message: message, sender: self)
    }
    func receive(message: String) {
        print("PM received: " + message)
    }
}

let mediator = TeamMediator()
let qe = QE(mediator: mediator)
let developer = Developer(mediator: mediator)
let pm = PM(mediator: mediator)
mediator.register(colleague: developer)
mediator.register(colleague: qe)
mediator.register(colleague: pm)
mediator.send(message: "Hello world!", sender: developer)
