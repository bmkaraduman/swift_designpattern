protocol LoggerStrategy {
    func log(_ message: String)
}

struct Logger {
    let strategy: LoggerStrategy
    
    func log(_ message: String)
    {
        strategy.log(message)
    }
}

struct lowerCaseStrategy: LoggerStrategy {
    func log(_ message: String) {
        print(message.lowercased())
    }
}

struct upperCaseStrategy: LoggerStrategy {
    func log(_ message: String) {
        print(message.uppercased())
    }
}

var loggerA = Logger(strategy: lowerCaseStrategy())
loggerA.log("My First Strategy")

var loggerB = Logger(strategy: upperCaseStrategy())
loggerB.log("Naber Koç")
