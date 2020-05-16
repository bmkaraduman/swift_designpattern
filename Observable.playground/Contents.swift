//Weak automatically resetted reference
//Eğer oluşturduğumuz closure’un nil olmaması gerekiyorsa unowned, nil olabiliyorsa da weak parametresi kullanılır.
//ARC -> Automatic Reference Counting


//willset -> Property Observers - Değer Kaydedilmeden hemen önce çalışır
//didSet -> Yeni değer kaydedildikten sonra çalışır.

//class AdimSayar {
//    var toplamAdim: Int = 5 {
//        willSet
//        {
//            print(newValue)
//        }
//        didSet
//        {
//            print(oldValue)
//        }
//    }
//}



//protocol ObservableProtocol {
//    func update(_ value: Int)
//}
//
//class TestObserver {
//    var observer: ObservableProtocol?
//
//    var point: Int = 0 {
//        willSet {
//            observer?.update(newValue)
//        }
//    }
//}
//
//class Observer: ObservableProtocol {
//    func update(_ value: Int) {
//        if value % 2 == 0
//        {
//            print("Even")
//        }
//        else
//        {
//            print("Odd")
//        }
//    }
//}
//
//let observer = Observer()
//
//let testObs = TestObserver()
//testObs.observer = observer
//testObs.point += 1
//testObs.point += 3

protocol Observer {
    var id: Int { get }
    func update<T>(with newValue: T)
}

protocol Observable {
    associatedtype T
    var _value: T { get set}
    var observers: [Observer] { get set}
    
    func addObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyAllObservers<T>(with newValue: T)
}


class Variable<T> : Observable {
    private var _value: T! = nil
    
    private var _observers: [Observer] = []
    
    var value: T {
        get {
            return self._value
        }
        set {
            self._value = newValue
            self.notifyAllObservers(with: newValue)
        }
    }
    
    var observers: [Observer] {
        get {
            return self._observers
        }
        set {
            self._observers = newValue
        }
    }
    
    func addObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        observers = observers.filter($0.id != observer.id)
    }
    
    func notifyAllObservers<T>(with newValue: T) {
        for observer in observers {
            observer.update(with: newValue)
        }
    }
}

class MyObserver: Observer {
    private var _id: Int = 0
    
    var id: Int {
        get{
            return self._id
        }
    }
    
    init(id: Int) {
        self._id = id
    }
    
    func update<T>(with newValue: T) {
        print("Whoaa, observer #\(self.id) updated with new value : ", newValue)
    }
}

var obs1 = MyObserver(id: 1)
var obs2 = MyObserver(id: 2)

var obsv = Variable<String>()
obsv.addObserver(observer: obs1)
obsv.addObserver(observer: obs2)

obsv.value = "Hello World"
obsv.removeObserver(observer: obs1)
obsv.value = "New World"
