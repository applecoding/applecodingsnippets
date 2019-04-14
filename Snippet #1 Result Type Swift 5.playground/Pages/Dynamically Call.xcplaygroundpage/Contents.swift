import Foundation

@dynamicCallable
class CalculadoraSuma {
    func dynamicallyCall(withArguments args:[Double]) -> Double {
        var sumatorio = 0.0
        for suma in args {
            sumatorio += suma
        }
        return sumatorio
    }
    
    func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, [Double]>) -> Double? {
        guard let arguments = args.first else {
            return nil
        }
        var resul = 0.0
        if arguments.key == "mul" {
            resul = 1.0
        }
        for num in arguments.value {
            switch arguments.key {
            case "suma":
                resul += num
            case "mul":
                resul *= num
            default:()
            }
        }
        return resul
    }
}

let sumatorio = CalculadoraSuma()
sumatorio(3,5,6,6.5)
sumatorio(2.5,6.5)

sumatorio(suma:[3,5,6,6.5])
sumatorio(mul:[3,5,6,6.5])
sumatorio(paco:[1,3,4,5,5])
