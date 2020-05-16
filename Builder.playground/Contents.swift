class WithoutBuilderSample
{
    private var hand: Bool
    private var foot: Bool
    private var head: Bool
    private var body: Bool
    
    init(Hand: Bool, Foot: Bool, Head: Bool, Body: Bool) {
        self.foot = Foot
        self.hand = Hand
        self.head = Head
        self.body = Body
    }
    
    func CreateHuman() -> Bool {
        print("Created Human")
        return true
    }
}


var newHuman = WithoutBuilderSample(Hand: true, Foot: true, Head: true, Body: true)
newHuman.CreateHuman()


class Human
{
    var hand: Bool = false
    var foot: Bool = false
    var head: Bool = false
    var body: Bool = false
}


class HumanBuilder
{
    var human = Human()
    
    func setHand(hand: Bool) -> HumanBuilder {
        human.hand = hand
        return self
    }
    
    func setFoot(foot: Bool) -> HumanBuilder {
        human.foot = foot
        return self
    }
    
    func setHead(head: Bool) -> HumanBuilder {
        human.head = head
        return self
    }
    
    func setBody(body: Bool) -> HumanBuilder {
        human.body = body
        return self
    }
    
    func build() -> Human
    {
        print("Eller \(human.hand), ayaklar\(human.foot), vucut\(human.body), bas\(human.head) builder ile oluşturuldu")
        return human
    }
}


var kk = HumanBuilder()
kk.setBody(body: true).setHand(hand: true).setFoot(foot: true).setHead(head: true).build()
