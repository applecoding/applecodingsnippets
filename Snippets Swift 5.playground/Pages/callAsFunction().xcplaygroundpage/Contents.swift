import UIKit
import Combine

final class ImageLoader {
    var url:URL
    var subscriber:AnyCancellable?
    var image:UIImage?
    
    init(url:URL) {
        self.url = url
    }
    
    func loadImage() {
        subscriber = URLSession.shared
            .dataTaskPublisher(for: url)
            .map {
                $0.data
            }
            .compactMap {
                UIImage(data: $0)
            }
            .sink(receiveCompletion: {
                if case .failure(let error) = $0 {
                    print("Error en la carga \(error)")
                }
            }, receiveValue: {
                self.image = $0
            })
        }
}

let load = ImageLoader(url: URL(string: "https://i.blogs.es/7ea98e/a-smartphone-in-close-up-view-3623360/840_560.jpg")!)
load.loadImage()
sleep(2)
load.image

final class ImageLoaderDynamic {
    var url:URL
    var subscriber:AnyCancellable?
    var image:UIImage?
    
    init(url:URL) {
        self.url = url
    }
    
    func callAsFunction() {
        subscriber = URLSession.shared
            .dataTaskPublisher(for: url)
            .map {
                $0.data
            }
            .compactMap {
                UIImage(data: $0)
            }
            .sink(receiveCompletion: {
                if case .failure(let error) = $0 {
                    print("Error en la carga \(error)")
                }
            }, receiveValue: {
                self.image = $0
            })
        }
}

let loadDynamic = ImageLoaderDynamic(url: URL(string: "https://i.blogs.es/7ea98e/a-smartphone-in-close-up-view-3623360/840_560.jpg")!)
loadDynamic()
sleep(2)
load.image

struct Dado {
    var caras:Int
    
    func callAsFunction() -> Int {
        Int.random(in: 1...caras)
    }
}

let dado1 = Dado(caras: 8)
let resultado = dado1()
resultado


