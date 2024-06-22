def CoreDependencyInjector
    target 'DependencyInjector' do
        # Libs bundled outside
        dependency_injector_pods
    
        target 'DependencyInjectorTests' do
            
        end
    end
end

def CoreLocalStorage
    target 'LocalStorage' do
        # Libs bundled outside
        dependency_injector_pods
    
        target 'LocalStorageTests' do
            
        end
    end
end

def Authentication
    target 'Authentication' do
        # Libs bundled outside
        dependency_injector_pods
    
        target 'AuthenticationTests' do
            
        end
    end
end