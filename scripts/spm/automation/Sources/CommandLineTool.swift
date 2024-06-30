import Foundation

public final class CommandLineTool {
    
    private let arguments: [String]
    private let type: AutomationType
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
        self.type = AutomationType(rawValue: arguments.object(index: 1) ?? "") ?? .error
    }

    public func run() throws {
        do {
            switch type {
            case .module: try CreateModuleTool(arguments: arguments).run()
            case .error: throw AutomationErrors.missingNameArgument
            }
        } catch {
            throw error
        }
    }
}
