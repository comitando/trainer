import Foundation

extension WorkspaceTemplates {
    
    static func projectYML(_ provider: String, _ moduleName: String, hasInterface: Bool) -> String {
        return hasInterface ? projectWithInterface(provider, moduleName) : projectWithoutInterface(provider, moduleName)
    }
    
    static func projectWithInterface(_ provider: String, _ moduleName: String) -> String {
        """
        ############
        # Targets
        ############

        targets:

          \(moduleName)Interface:
            
            # templates
            templates:
              - StaticFramework
            
            # templateAttributes
            templateAttributes:
              frameworkPath: libraries/\(provider)/\(moduleName)
            
          \(moduleName):
            
            # templates
            templates:
              - StaticFramework
            
            # templateAttributes
            templateAttributes:
              frameworkPath: libraries/\(provider)/\(moduleName)
            
            dependencies:
             - target: DependencyInjector
             - target: \(moduleName)Interface
              
            # scheme
            scheme:
              gatherCoverageData: true
              coverageTargets:
                - \(moduleName)
              testTargets:
                - name: \(moduleName)Tests
                  parallelizable: true
                  randomExecutionOrder: true

          \(moduleName)Tests:
            
            # templates
            templates:
              - FrameworkTests
            
            # templateAttributes
            templateAttributes:
              frameworkPath: libraries/\(provider)/\(moduleName)

            # dependencies
            dependencies:
              - target: \(moduleName)
        """
    }
    
    static func projectWithoutInterface(_ provider: String, _ moduleName: String) -> String {
        """
        ############
        # Targets
        ############

        targets:

          \(moduleName):
            
            # templates
            templates:
              - StaticFramework
            
            # templateAttributes
            templateAttributes:
              frameworkPath: libraries/\(provider)/\(moduleName)
            
            dependencies:
             - target: DependencyInjector
              
            # scheme
            scheme:
              gatherCoverageData: true
              coverageTargets:
                - \(moduleName)
              testTargets:
                - name: \(moduleName)Tests
                  parallelizable: true
                  randomExecutionOrder: true

          \(moduleName)Tests:
            
            # templates
            templates:
              - FrameworkTests
            
            # templateAttributes
            templateAttributes:
              frameworkPath: libraries/\(provider)/\(moduleName)

            # dependencies
            dependencies:
              - target: \(moduleName)
        """
    }
}
