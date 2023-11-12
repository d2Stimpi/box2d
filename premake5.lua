workspace "Box2DWS"
	configurations { "Debug", "Release", "Dist" }
	platforms { "Win32", "x64" }

	outputdir = "Debug-x64"

	filter { "platforms:Win32" }
    system "Windows"
    architecture "x86"

filter { "platforms:ARM" }
    system "Windows"
    architecture "x64"

project "Box2D"
	kind "StaticLib"
	--architecture "x64"
	language "C++"
	cppdialect "C++11"
	staticruntime "off"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{ 
		"src/**.h",
		"src/**.cpp",
		"include/**.h" 
	}
	
	includedirs
	{
		"include",
		"src"
	}
	
	filter "system:windows"
		systemversion "latest"
	
	filter "configurations.Debug"
		runtime "Debug"
		symbols "on"
	
	filter "configurations.Release"
		runtime "Release"
		optimize "on"
		
	filter "configurations.Dist"
		runtime "Release"
		optimize "on"