import 'scripts/rakefile/Rakefile'

namespace :libraries do
    task :project do
        sh "cd scripts/spm/automation && open Package.swift"
    end

    task :create do 
        modulePhrase = "1. Selecione o tipo de automação"
        moduleOptions = ["module"]
        moduleStruct = prompt_select(modulePhrase, moduleOptions)

        if moduleStruct === "module"
            providerPhrase = "2. Selecione o tipo de provider:  "
            providerOptions = ["core", "domain", "ui"]
            providerStruct = prompt_select(providerPhrase, providerOptions)

            STDOUT.puts "3. Qual o nome do seu framework? (use the CamelCase pattern)"
            frameworkDomain = STDIN.gets.strip

            interfacePhrase = "4. Precisa de um framework de Interface:  "
            interfaceOptions = ["true", "false"]
            interfaceStruct = prompt_select(interfacePhrase, interfaceOptions)

            sh "find scripts -name '*.sh' -exec chmod +x {} +"
            sh "cd scripts/spm && ./automations.sh #{moduleStruct} #{providerStruct} #{frameworkDomain} #{interfaceStruct} && cd ../../"
            sh "ls"
        end
    end
end