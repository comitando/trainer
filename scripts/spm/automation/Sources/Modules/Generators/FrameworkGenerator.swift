import Foundation
import Files

class FrameworkGenerator: GeneratorType {
    
    static func generate(_ provider: String, _ moduleName: String, _ hasInterface: Bool, _ rootFolder: Folder) throws {
        do {
            
            log("Creating \(moduleName) files")
            
            let infoPLIST = try rootFolder.createFile(named: "Info.plist")
            try infoPLIST.write(FrameworkTemplates.infoPLIST())
            log(infoPLIST)
            
            let mainClass = try rootFolder.createFile(named: "\(moduleName)Initializer.swift")
            try mainClass.write(FrameworkTemplates.mainClass(moduleName, hasInterface: hasInterface))
            log(mainClass)
            
        } catch {
            throw CreateModuleErrors.FrameworkCreationFailure
        }
    }
}
