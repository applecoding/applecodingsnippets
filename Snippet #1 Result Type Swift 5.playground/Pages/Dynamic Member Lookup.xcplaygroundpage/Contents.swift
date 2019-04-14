import Foundation

@dynamicMemberLookup
struct Persona {
    subscript(dynamicMember valor:String) -> String {
        let valores = ["nombre": "Julio César", "ciudad": "Madrid"]
        return valores[valor, default: ""]
    }
    subscript(dynamicMember valor:String) -> Int {
        let valores = ["edad": 43, "altura":182]
        return valores[valor, default:0]
    }
}

let persona = Persona()
let nombre:String = persona.nombre
let ciudad:String = persona.ciudad
let edad:Int = persona.edad

@dynamicCallable
struct CalculadoraSuma {
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
sumatorio(3,5,7.8,2)
sumatorio(6,7,8,2,4.5,4.8,1,4,10,4)

sumatorio(suma:[6,7,8,2,4.5,4.8,1,4,10,4])
sumatorio(mul:[3,5,7.8,2])
