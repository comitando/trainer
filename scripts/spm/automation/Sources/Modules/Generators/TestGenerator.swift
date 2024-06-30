import Foundation
import Files

class TestGenerator: GeneratorType {
    static func generate(_ provider: String, _ moduleName: String, _ hasInterface: Bool, _ rootFolder: Files.Folder) throws {
        do {
            
            let infoPLIST = try rootFolder.createFile(named: "Info.plist")
            try infoPLIST.write(TestTemplates.infoPLIST())
            log(infoPLIST)
            
            let mainTest = try rootFolder.createFile(named: "\(moduleName)Tests.swift")
            try mainTest.write(TestTemplates.mainClass(moduleName))
            log(mainTest)
            
        } catch {
            throw CreateModuleErrors.TestsCreationFailure
        }
    }
}
