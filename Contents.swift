// Sevan Golnazarian
//
// April 8, 2020
//
// experimenting with enums that perform curried operations

import Foundation

enum Operate {
    case Plus
    case Minus
    case Multiply
    case Divide
    
    var op: (Int) -> (Int) -> Int {
        get {
            switch self {
            case .Plus:
                return { n in
                    return { n + $0}
                }
            case .Minus:
                return { n in
                    return { n - $0}
                }
            case .Multiply:
                return { n in
                    return { n * $0}
                }
            case .Divide:
                return { n in
                    return { n / $0}
                }
            }
        }
    }
}

let multiply = Operate.Multiply.op
let plus = Operate.Plus.op
// 3 + (16 * 2) -> 35
plus(3)(multiply(16)(2))
