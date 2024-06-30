import Foundation
import Files

public final class CreateModuleTool {
    
    private let arguments: [String]
    private var providerName: String?
    private var moduleName: String?
    private var hasInterface: Bool
    
    public init(arguments: [String]) {
        self.arguments = arguments
        self.providerName = arguments.object(index: 2)
        self.moduleName = arguments.object(index: 3)
        self.hasInterface = Bool(arguments.object(index: 4) ?? "false") ?? false
    }
    
    public func run() throws {
        do {
            
            guard let providerName, let moduleName, !providerName.isEmpty, !moduleName.isEmpty else {
                throw CreateModuleErrors.MissingNameArgument
            }
            
            logStart("Create \(moduleName) Module")

            let rootFolder = try Folder.current.createSubfolder(named: moduleName)
            
            let mainFolder = try rootFolder.createSubfolder(named: moduleName)
            try FrameworkGenerator.generate(providerName, moduleName, hasInterface, mainFolder)
            
            if hasInterface {
                let interfaceFolder = try rootFolder.createSubfolder(named: "\(moduleName)Interface")
                try InterfaceGenerator.generate(providerName, moduleName, hasInterface, interfaceFolder)
            }
            
            let testFolder = try rootFolder.createSubfolder(named: "\(moduleName)Tests")
            try TestGenerator.generate(providerName, moduleName, hasInterface, testFolder)
            
            try WorkspaceGenerator.generate(providerName, moduleName, hasInterface, rootFolder)
            try WorkspaceSetup.generate(providerName, moduleName, hasInterface, .current)
            
            logEnd("\(moduleName) successfully created")
            
        } catch {
            throw error
        }
    }
}
