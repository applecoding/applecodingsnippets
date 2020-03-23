import ArgumentParser

struct Suma:ParsableCommand {
    @Argument(help: "Primera cifra a sumar") var suma1:Int
    @Argument(help: "Segunda cifra a sumar") var suma2:Int
    
    func run() {
        print("La suma es: \(suma1+suma2)")
    }
}

Suma.main()
