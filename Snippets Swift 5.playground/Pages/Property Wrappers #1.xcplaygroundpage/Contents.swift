import Foundation

struct FIFOStack <T> {
    private var storage:[T] = []
    
    mutating func addValue(value:T) {
        storage.insert(value, at: 0)
    }
    
    mutating func extractValue() -> T {
        storage.removeFirst()
    }
}

var stack1 = FIFOStack<Int>()
stack1.addValue(value: 10)
stack1.addValue(value: 20)
stack1.extractValue()

@propertyWrapper
class FIFOStackClass<T> {
    var storage:[T] = []
    
    var value:T {
        get {
            storage.removeFirst()
        }
        set {
            storage.insert(newValue, at: 0)
        }
    }
}

struct TestStorage {
    @FIFOStackClass private var stack:Int
    
    func addValue(value:Int) {
        stack = value
    }
    
    func extract() -> Int {
        stack
    }
}

let test1 = TestStorage()
test1.addValue(value: 20)
test1.addValue(value: 30)
test1.extract()




