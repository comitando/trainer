import Foundation
import Files

class WorkspaceSetup: GeneratorType {
    static func generate(_ provider: String, _ moduleName: String, _ hasInterface: Bool, _ rootFolder: Folder) throws {
        do {
            
            let script = try rootFolder.createFile(named: "genWorkspace.sh")
            try script.write(WorkspaceTemplates.script(provider, moduleName))
            
            let terminalTask = Process()
            terminalTask.launchPath = "/bin/bash"
            terminalTask.arguments = ["-c", "sh genWorkspace.sh"]
            try terminalTask.run()
            terminalTask.waitUntilExit()
            
            try script.delete()
            
        } catch {
            throw CreateModuleErrors.WorkspaceSetupFailure
        }
    }
}

