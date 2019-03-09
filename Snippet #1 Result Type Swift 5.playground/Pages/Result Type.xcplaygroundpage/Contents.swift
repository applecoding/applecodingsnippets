import UIKit

enum ErrorSuma:Error {
    case arrayVacio
}

func sumaNumeros(nums:[Int]) -> Result<Int, ErrorSuma> {
    if nums.isEmpty {
        return .failure(.arrayVacio)
    }
    return .success(nums.reduce(0,+))
}

let numeros = [1,4,5,6,4,5,4,5,4,7,8,9,4]
let suma = sumaNumeros(nums: numeros)
let suma2 = sumaNumeros(nums: [])

if case .success(let sumatorio) = suma {
    print("Resultado \(sumatorio)")
}

switch suma2 {
case .success(let resultado): print("Resultado \(resultado)")
case .failure(let error): print("Ha ocurrido un error \(error)")
}

if let suma = try? suma.get() {
    print("El resultado de la suma \(suma)")
}

do {
    let sumaOK = try suma2.get()
    print(sumaOK)
} catch ErrorSuma.arrayVacio {
    print("El array está vacío")
}

if let fichero = Bundle.main.url(forResource: "test", withExtension: "json") {
    let result = Result { try Data(contentsOf: fichero) }
    if case .success(let contenido) = result {
        print(String(data: contenido, encoding: .utf8)!)
    }
}

