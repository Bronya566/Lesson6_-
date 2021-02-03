import UIKit
import Foundation

struct Queue<T:Comparable>{
    private var chislo: [T] = []
    
    mutating func push(_ elements: T){
    chislo.append(elements)
    }
    
    mutating func pop() -> T? {
        guard chislo.count > 0  else {return nil}
        return chislo.removeFirst()
    }
    
    mutating func sorted(isUp: Bool) -> [T] {
        if isUp {
            chislo = chislo.sorted(by: up)
        } else {
            chislo = chislo.sorted(by: down)
        }
        return chislo
    }
    
    mutating func filter(predicate: (T) -> Bool) -> [T] {
        var tmp: [T] = []
        for element in chislo {
            if predicate(element) {
                tmp.append(element)
            }
        }
        chislo = tmp
        return chislo
    }
    
    private func up(_ item0: T, _ item1: T) -> Bool {
        return item0 > item1
    }
    
    private func down(_ item0: T, _ item1: T) -> Bool {
        return item0 < item1
    }

    
}

extension Queue {
    
    subscript(index: Int) -> T? {
        return index >= chislo.count ? nil : chislo[index]
    }
    
}
var stringQueue = Queue<String>()
var intQueue = Queue<Int>()

stringQueue.push("qw")
stringQueue.push("er")
stringQueue.push("ty")
intQueue.push(1)
intQueue.push(2)
intQueue.push(3)
intQueue.push(4)
intQueue.push(5)
intQueue.push(6)
print(stringQueue)
print(intQueue)
stringQueue.pop()
intQueue.pop()
print(stringQueue)
print(intQueue)

intQueue.filter() { $0 % 2 == 0 }
print(intQueue)
intQueue.sorted(isUp: true)
print(intQueue)
print(intQueue[2])
print(intQueue[0])
print(intQueue[4])
print(intQueue[3])

