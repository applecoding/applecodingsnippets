import Foundation

@propertyWrapper
struct UserDefault<T> {
    let key:String
    let defaultValue:T
    
    var value:T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

enum GlobalSettings {
    @UserDefault(key: "darkMode", defaultValue: false) static var darkMode:Bool
}

GlobalSettings.darkMode = true
GlobalSettings.darkMode


