@echo off
"C:\\Users\\AL RASHIDS\\AppData\\Local\\Android\\Sdk\\cmake\\3.22.1\\bin\\cmake.exe" ^
  "-HC:\\src\\flutter\\packages\\flutter_tools\\gradle\\src\\main\\groovy" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=21" ^
  "-DANDROID_PLATFORM=android-21" ^
  "-DANDROID_ABI=x86" ^
  "-DCMAKE_ANDROID_ARCH_ABI=x86" ^
  "-DANDROID_NDK=C:\\Users\\AL RASHIDS\\AppData\\Local\\Android\\Sdk\\ndk\\27.0.12077973" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\AL RASHIDS\\AppData\\Local\\Android\\Sdk\\ndk\\27.0.12077973" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\AL RASHIDS\\AppData\\Local\\Android\\Sdk\\ndk\\27.0.12077973\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\AL RASHIDS\\AppData\\Local\\Android\\Sdk\\cmake\\3.22.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=D:\\VS codes\\DeveloperHub Cor Projects\\task_management_app\\build\\app\\intermediates\\cxx\\Debug\\5i40w372\\obj\\x86" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=D:\\VS codes\\DeveloperHub Cor Projects\\task_management_app\\build\\app\\intermediates\\cxx\\Debug\\5i40w372\\obj\\x86" ^
  "-DCMAKE_BUILD_TYPE=Debug" ^
  "-BD:\\VS codes\\DeveloperHub Cor Projects\\task_management_app\\android\\app\\.cxx\\Debug\\5i40w372\\x86" ^
  -GNinja ^
  -Wno-dev ^
  --no-warn-unused-cli
