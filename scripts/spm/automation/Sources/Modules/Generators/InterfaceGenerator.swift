import Foundation
import Files

class InterfaceGenerator: GeneratorType {
    static func generate(_ provider: String, _ moduleName: String, _ hasInterface: Bool, _ rootFolder: Files.Folder) throws {
        do {
            
            let infoPLIST = try rootFolder.createFile(named: "Info.plist")
            try infoPLIST.write(InterfaceTemplates.infoPLIST())
            log(infoPLIST)
            
            let mainClass = try rootFolder.createFile(named: "\(moduleName)Interface.swift")
            try mainClass.write(InterfaceTemplates.mainClass(moduleName))
            log(mainClass)
            
        } catch {
            throw CreateModuleErrors.InterfaceCreationFailure
        }
    }
}
