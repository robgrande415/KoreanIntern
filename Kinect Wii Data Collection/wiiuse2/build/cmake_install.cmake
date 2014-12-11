# Install script for directory: /Users/RobertGrande/Kinect/wiiuse2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "docs")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/wiiuse" TYPE FILE FILES
    "/Users/RobertGrande/Kinect/wiiuse2/CHANGELOG.mkd"
    "/Users/RobertGrande/Kinect/wiiuse2/LICENSE"
    "/Users/RobertGrande/Kinect/wiiuse2/README.mkd"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "examples")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/wiiuse/example" TYPE FILE FILES "/Users/RobertGrande/Kinect/wiiuse2/example/example.c")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "examples")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/doc/wiiuse/example-sdl" TYPE FILE FILES "/Users/RobertGrande/Kinect/wiiuse2/example-sdl/sdl.c")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/Users/RobertGrande/Kinect/wiiuse2/build/src/cmake_install.cmake")
  include("/Users/RobertGrande/Kinect/wiiuse2/build/example/cmake_install.cmake")
  include("/Users/RobertGrande/Kinect/wiiuse2/build/example-sdl/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

file(WRITE "/Users/RobertGrande/Kinect/wiiuse2/build/${CMAKE_INSTALL_MANIFEST}" "")
foreach(file ${CMAKE_INSTALL_MANIFEST_FILES})
  file(APPEND "/Users/RobertGrande/Kinect/wiiuse2/build/${CMAKE_INSTALL_MANIFEST}" "${file}\n")
endforeach()
