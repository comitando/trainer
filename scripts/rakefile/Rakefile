require 'rake'
require 'tty-prompt'
require 'yaml'

def createModule(moduleStruct)
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
    
    file_path = "project.yml"
    new_include = { "path" => "libraries/#{providerStruct}/#{frameworkDomain}/project.yml", "relativePaths" => false }

    project_data = YAML.load_file(file_path)

    if project_data['include']
        unless project_data['include'].include?(new_include)
            project_data['include'] << new_include
            puts "Added new include: #{new_include}"
        else
            puts "Include already exists: #{new_include}"
        end
    else
        project_data['include'] = [new_include]
        puts "Created 'include' key and added new include: #{new_include}"
    end

    File.open(file_path, 'w') do |file|
        file.write(project_data.to_yaml)
    end

    puts "Updated #{file_path} successfully."

    xcodePhrase = "5. Deseja abrir o xcode"
    xcodeOptions = ["Yes", "No"]
    xcodeStruct = prompt_select(xcodePhrase, xcodeOptions)

    if xcodeStruct === "Yes"
        Rake::Task["xcode:generate"].invoke 
    end
end

###############################################################################
#                                Prompt                                       #
###############################################################################
def prompt_select(phrase, options)
    prompt = TTY::Prompt.new
    selected_option = prompt.select(phrase, options)
    return selected_option
end