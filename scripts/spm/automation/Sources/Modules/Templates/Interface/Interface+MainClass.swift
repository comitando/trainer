import Foundation

extension InterfaceTemplates {    
    static func mainClass(_ moduleName: String) -> String {
        """
        import Foundation

        public protocol \(moduleName)Interface {
            @discardableResult func helloWorld() -> String
        }
        """
    }
}
