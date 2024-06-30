import Foundation

extension FrameworkTemplates {
    
    static func mainClass(_ moduleName: String, hasInterface: Bool) -> String {
        return hasInterface ? classWithInterface(moduleName) : classWithoutInterface(moduleName)
    }
    
    static func classWithInterface(_ moduleName: String) -> String {
        """
        import Foundation
        import \(moduleName)Interface
        
        public final class \(moduleName)Initializer: \(moduleName)Interface {
            @discardableResult
            public func helloWorld() -> String {
                return "\(moduleName)"
            }
        }
        """
    }
    
    static func classWithoutInterface(_ moduleName: String) -> String {
        """
        import Foundation
        
        public final class \(moduleName)Initializer {
            @discardableResult
            public func helloWorld() -> String {
                return "\(moduleName)"
            }
        }
        """
    }
}
