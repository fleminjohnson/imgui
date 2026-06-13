outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "ImGui"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  staticruntime "on"

	targetdir ("bin/"..outputdir.."/%{prj.name}")
	objdir ("bin-int/"..outputdir.."/%{prj.name}")

files 
{
  "imconfig.h",
  "imgui.cpp",
  "imgui.h",
  "imgui_demo.cpp",
  "imgui_draw.cpp",
  "imgui_internal.h",
  "imgui_tables.cpp",
  "imgui_widgets.cpp",
  "imstb_rectpack.h",
  "imstb_textedit.h",
  "imstb_truetype.h"
}

filter "system:windows"
  systemversion "latest"

--filter {"system:windows", "configurations:Release"}
--buildoptions "/MT"


  filter "configurations:Debug"
    --defines "TB_DEBUG"
    runtime "Debug"
    --buildoptions "/MDd"
    symbols "on"

  filter "configurations:Release"
    --defines "TB_RELEASE"
    runtime "Release"
    --buildoptions "/MD"
    optimize "on"
