cmake_minimum_required(VERSION 3.5)

project(RashodiQuick LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

set(SOURCE_FILES src/dataadder.cpp)

if(ANDROID)
    add_library(RashodiQuick SHARED main.cpp qml.qrc)
else()
    add_executable(RashodiQuick main.cpp qml.qrc ${SOURCE_FILES})
endif()

target_compile_definitions(RashodiQuick
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(RashodiQuick
  PRIVATE Qt5::Core Qt5::Quick)

#include_directories( src)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check http://doc.qt.io/qt-5/deployment-android.html for more information.
# These variables must use CACHE, otherwise QtCreator won't see them.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android" CACHE INTERNAL "")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so CACHE INTERNAL "")
#    endif()
#endif()


