import Foundation
import Files

protocol GeneratorType: AnyObject {
    static func generate(_ provider: String, _ moduleName: String, _ hasInterface: Bool, _ rootFolder: Folder) throws
}

extension GeneratorType {
    static func log(_ header: String) {
        print("\n")
        print(String(repeating: "=", count: 50))
        print(">> \(header)")
        print(String(repeating: "=", count: 50))
        print("\n")
    }
    
    static func log(_ file: File) {
        print(">> Created \(file.name)")
    }
}
