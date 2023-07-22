-- Glad
workspace "Glad"
    architecture "x64"
    startproject "Glad"
    
    configurations {
        "Debug",
        "Release"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}" 

include "Glad"

-- imgui
workspace "imgui"
    architecture "x64"
    startproject "imgui"
    
    configurations {
        "Debug",
        "Release"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}" 

include "imgui"


-- clean
function cleanProject(projectDir)
    print("Cleaning Project : " .. projectDir)
    print("Removing binaries")
    os.rmdir(projectDir .. "/bin")

    print("Removing intermediate binaries")
    os.rmdir(projectDir .. "/bin-int")

    print("Removing project files")
    os.rmdir(projectDir .. "/.vs")
    os.rmdir(projectDir .. "/Generated")
    os.remove("**.vcxproj")
    os.remove("**.vcxproj.filters")
    os.remove("**.vcxproj.user")

end

newaction {
    trigger = "clean",
    description = "Remove all binaries and intermediate binaries, and vs files.",
    execute = function()
        cleanProject("./Glad")
        cleanProject("./imgui")    
        print("Removing Solution Files")
        os.remove("**.sln")
    
        print("Deleting .vs directory")
        os.rmdir(".vs")
    
        print("Done")
    end
}