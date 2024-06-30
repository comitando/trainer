import Foundation

public struct FrameworkTemplates {}
public struct InterfaceTemplates {}
public struct TestTemplates {}
public struct WorkspaceTemplates {}

public enum CreateModuleErrors: Error {
    case MissingNameArgument
    case FrameworkCreationFailure
    case InterfaceCreationFailure
    case TestsCreationFailure
    case WorkspaceGenerationFailure
    case WorkspaceSetupFailure
}

func logStart(_ typeName: String) {
    print("\n")
    print(String(repeating: "=", count: 50))
    print(">> Starting \(typeName) ☕️")
    print(String(repeating: "=", count: 50))
    print("\n")
}

func logEnd(_ podName: String) {
    print("\n")
    print(String(repeating: "=", count: 50))
    print(">> Microfrontend SDK successfully created \(podName) 🚀")
    print(String(repeating: "=", count: 50))
    print("\n")
}

public extension Array {
    func object(index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }
}

public enum AutomationType: String {
    case module
    case error
}

public enum AutomationErrors: Error {
    case missingNameArgument
}
