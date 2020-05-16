protocol LampState {
    func onOpen()
    func onClose()
}

class LampOpenState: LampState {
    func onOpen() {
        print("Lamba Zaten Açık")
    }
    
    func onClose() {
        print("Lamba Açık Kapatılıyor")
    }
}

class LampCloseState: LampState {
    func onClose() {
        print("Lamba Zaten Kapalı")
    }
    
    func onOpen() {
        print("Lamba Açılıyor")
    }
}

class ContextLamp
{
    private var lampState: LampState = LampCloseState()
    
    func onOpen()
    {
        lampState.onOpen()
    }
    
    func onClose()
    {
        lampState.onClose()
    }
    
    func getLampState() -> LampState
    {
        return lampState
    }
    
    func setLampState(lampState: LampState)  {
        self.lampState = lampState
    }
    
}

var context = ContextLamp()
context.onOpen()
