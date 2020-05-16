class Computer
{
    var newOperatingsystem = OperatingSystem()
    var newHardware = Harware()
    
    
    func createComputer()
    {
        newHardware.createHardware()
        newOperatingsystem.createOperatingSystem()
    }
}

class OperatingSystem
{
    func createOperatingSystem()
    {
        print("Operating System Created")
    }
}

class Harware
{
    func createHardware()
    {
        print("Hardware Oluşturuldu")
    }
}

var newComputer = Computer()
newComputer.createComputer()
