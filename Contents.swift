// Sevan Golnazarian
//
// April 8, 2020
//
// experimenting with enums that perform curried operations

import Foundation

enum Operate {
    case plus
    case minus
    case multiply
    case unsafeDivide
    
    func curry<A,B,C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
        return { a in { b in f(a, b) } }
    }
    
    var op: (Double) -> (Double) -> Double {
        switch self {
        case .plus:
            return curry(+)
        case .minus:
            return curry(-)
        case .multiply:
            return curry(*)
        case .unsafeDivide:
            return curry(/)
        }
    }
}

let multiply = Operate.multiply.op
let plus = Operate.plus.op
let unsafeDivide = Operate.unsafeDivide.op

let result = plus(3)(multiply(16)(2))
print(result) // 3 + (16.0 * 2) -> 35.0

let calculatedResults = [2.3, 6.3, 9.87, 0.23].map(multiply(2))
