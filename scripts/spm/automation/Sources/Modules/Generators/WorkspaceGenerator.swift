import Foundation
import Files

class WorkspaceGenerator: GeneratorType {
    static func generate(_ provider: String, _ moduleName: String, _ hasInterface: Bool, _ rootFolder: Folder) throws {
        do {
            
            let projectYml = try rootFolder.createFile(named: "project.yml")
            try projectYml.write(WorkspaceTemplates.projectYML(provider, moduleName, hasInterface: hasInterface))
            log(projectYml)
            
        } catch {
            throw CreateModuleErrors.WorkspaceGenerationFailure
        }
    }
}

