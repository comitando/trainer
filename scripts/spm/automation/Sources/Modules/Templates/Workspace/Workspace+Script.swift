import Foundation

extension WorkspaceTemplates {
    
    static func script(_ provider: String, _ moduleName: String) -> String {
        let template = {
            """
            #!/bin/bash
            
            # Jump to repository root
            cd "$(git rev-parse --show-toplevel)"
            
            source="scripts/spm/\(moduleName)"
            destination="libraries/\(provider)"
            
            # Verify if folder already exists
            if [ ! -d "./libraries/\(provider)/\(moduleName)" ]; then
                echo "\n\n>> Creating \(moduleName) module in the root"
                mkdir -p "$destination"
                cp -r "$source" "$destination"
            else
                echo ">> \(moduleName) in \(provider) already exists";
            fi

            # Check the file is exists or not
            rm -rf "$source"
            echo ">> \(moduleName) was removed in the Automation Packages"
            
            #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            """
        }()
        return template
    }
}

