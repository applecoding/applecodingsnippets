import UIKit

enum Resultado<Int, String> {
    case OK(Int)
    case ERROR(String)
}

let valor:Resultado<Int,String> = .OK(10)
let otro:Resultado<Int,String> = .ERROR("Ha dado error")

func sumaNumeros(nums:[Int]) -> Resultado<Int,String> {
    if nums.isEmpty {
        return .ERROR("No has mandado nada")
    }
    return .OK(nums.reduce(0,+))
}

let numeros = [1,4,5,6,4,5,4,5,4,7,8,9,4]
let suma = sumaNumeros(nums: numeros)
let suma2 = sumaNumeros(nums: [])

if case .OK(let sumatorio) = suma {
    print("Resultado \(sumatorio)")
}

switch suma2 {
case .OK(let resultado): print("Resultado \(resultado)")
case .ERROR(let error): print("Ha ocurrido un error \(error)")
}

