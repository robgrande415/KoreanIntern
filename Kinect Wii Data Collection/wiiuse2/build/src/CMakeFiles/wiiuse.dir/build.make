# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CMake.app/Contents/bin/cmake

# The command to remove a file.
RM = /Applications/CMake.app/Contents/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/RobertGrande/Kinect/wiiuse2

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/RobertGrande/Kinect/wiiuse2/build

# Include any dependencies generated for this target.
include src/CMakeFiles/wiiuse.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/wiiuse.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/wiiuse.dir/flags.make

src/CMakeFiles/wiiuse.dir/classic.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/classic.c.o: ../src/classic.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/classic.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/classic.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/classic.c

src/CMakeFiles/wiiuse.dir/classic.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/classic.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/classic.c > CMakeFiles/wiiuse.dir/classic.c.i

src/CMakeFiles/wiiuse.dir/classic.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/classic.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/classic.c -o CMakeFiles/wiiuse.dir/classic.c.s

src/CMakeFiles/wiiuse.dir/classic.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/classic.c.o.requires

src/CMakeFiles/wiiuse.dir/classic.c.o.provides: src/CMakeFiles/wiiuse.dir/classic.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/classic.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/classic.c.o.provides

src/CMakeFiles/wiiuse.dir/classic.c.o.provides.build: src/CMakeFiles/wiiuse.dir/classic.c.o

src/CMakeFiles/wiiuse.dir/dynamics.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/dynamics.c.o: ../src/dynamics.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/dynamics.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/dynamics.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/dynamics.c

src/CMakeFiles/wiiuse.dir/dynamics.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/dynamics.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/dynamics.c > CMakeFiles/wiiuse.dir/dynamics.c.i

src/CMakeFiles/wiiuse.dir/dynamics.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/dynamics.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/dynamics.c -o CMakeFiles/wiiuse.dir/dynamics.c.s

src/CMakeFiles/wiiuse.dir/dynamics.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/dynamics.c.o.requires

src/CMakeFiles/wiiuse.dir/dynamics.c.o.provides: src/CMakeFiles/wiiuse.dir/dynamics.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/dynamics.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/dynamics.c.o.provides

src/CMakeFiles/wiiuse.dir/dynamics.c.o.provides.build: src/CMakeFiles/wiiuse.dir/dynamics.c.o

src/CMakeFiles/wiiuse.dir/events.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/events.c.o: ../src/events.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/events.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/events.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/events.c

src/CMakeFiles/wiiuse.dir/events.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/events.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/events.c > CMakeFiles/wiiuse.dir/events.c.i

src/CMakeFiles/wiiuse.dir/events.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/events.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/events.c -o CMakeFiles/wiiuse.dir/events.c.s

src/CMakeFiles/wiiuse.dir/events.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/events.c.o.requires

src/CMakeFiles/wiiuse.dir/events.c.o.provides: src/CMakeFiles/wiiuse.dir/events.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/events.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/events.c.o.provides

src/CMakeFiles/wiiuse.dir/events.c.o.provides.build: src/CMakeFiles/wiiuse.dir/events.c.o

src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o: ../src/guitar_hero_3.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/guitar_hero_3.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/guitar_hero_3.c

src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/guitar_hero_3.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/guitar_hero_3.c > CMakeFiles/wiiuse.dir/guitar_hero_3.c.i

src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/guitar_hero_3.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/guitar_hero_3.c -o CMakeFiles/wiiuse.dir/guitar_hero_3.c.s

src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o.requires

src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o.provides: src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o.provides

src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o.provides.build: src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o

src/CMakeFiles/wiiuse.dir/io.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/io.c.o: ../src/io.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/io.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/io.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/io.c

src/CMakeFiles/wiiuse.dir/io.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/io.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/io.c > CMakeFiles/wiiuse.dir/io.c.i

src/CMakeFiles/wiiuse.dir/io.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/io.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/io.c -o CMakeFiles/wiiuse.dir/io.c.s

src/CMakeFiles/wiiuse.dir/io.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/io.c.o.requires

src/CMakeFiles/wiiuse.dir/io.c.o.provides: src/CMakeFiles/wiiuse.dir/io.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/io.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/io.c.o.provides

src/CMakeFiles/wiiuse.dir/io.c.o.provides.build: src/CMakeFiles/wiiuse.dir/io.c.o

src/CMakeFiles/wiiuse.dir/ir.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/ir.c.o: ../src/ir.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/ir.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/ir.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/ir.c

src/CMakeFiles/wiiuse.dir/ir.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/ir.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/ir.c > CMakeFiles/wiiuse.dir/ir.c.i

src/CMakeFiles/wiiuse.dir/ir.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/ir.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/ir.c -o CMakeFiles/wiiuse.dir/ir.c.s

src/CMakeFiles/wiiuse.dir/ir.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/ir.c.o.requires

src/CMakeFiles/wiiuse.dir/ir.c.o.provides: src/CMakeFiles/wiiuse.dir/ir.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/ir.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/ir.c.o.provides

src/CMakeFiles/wiiuse.dir/ir.c.o.provides.build: src/CMakeFiles/wiiuse.dir/ir.c.o

src/CMakeFiles/wiiuse.dir/nunchuk.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/nunchuk.c.o: ../src/nunchuk.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/nunchuk.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/nunchuk.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/nunchuk.c

src/CMakeFiles/wiiuse.dir/nunchuk.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/nunchuk.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/nunchuk.c > CMakeFiles/wiiuse.dir/nunchuk.c.i

src/CMakeFiles/wiiuse.dir/nunchuk.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/nunchuk.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/nunchuk.c -o CMakeFiles/wiiuse.dir/nunchuk.c.s

src/CMakeFiles/wiiuse.dir/nunchuk.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/nunchuk.c.o.requires

src/CMakeFiles/wiiuse.dir/nunchuk.c.o.provides: src/CMakeFiles/wiiuse.dir/nunchuk.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/nunchuk.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/nunchuk.c.o.provides

src/CMakeFiles/wiiuse.dir/nunchuk.c.o.provides.build: src/CMakeFiles/wiiuse.dir/nunchuk.c.o

src/CMakeFiles/wiiuse.dir/wiiuse.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/wiiuse.c.o: ../src/wiiuse.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/wiiuse.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/wiiuse.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/wiiuse.c

src/CMakeFiles/wiiuse.dir/wiiuse.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/wiiuse.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/wiiuse.c > CMakeFiles/wiiuse.dir/wiiuse.c.i

src/CMakeFiles/wiiuse.dir/wiiuse.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/wiiuse.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/wiiuse.c -o CMakeFiles/wiiuse.dir/wiiuse.c.s

src/CMakeFiles/wiiuse.dir/wiiuse.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/wiiuse.c.o.requires

src/CMakeFiles/wiiuse.dir/wiiuse.c.o.provides: src/CMakeFiles/wiiuse.dir/wiiuse.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/wiiuse.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/wiiuse.c.o.provides

src/CMakeFiles/wiiuse.dir/wiiuse.c.o.provides.build: src/CMakeFiles/wiiuse.dir/wiiuse.c.o

src/CMakeFiles/wiiuse.dir/wiiboard.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/wiiboard.c.o: ../src/wiiboard.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/wiiboard.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/wiiboard.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/wiiboard.c

src/CMakeFiles/wiiuse.dir/wiiboard.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/wiiboard.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/wiiboard.c > CMakeFiles/wiiuse.dir/wiiboard.c.i

src/CMakeFiles/wiiuse.dir/wiiboard.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/wiiboard.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/wiiboard.c -o CMakeFiles/wiiuse.dir/wiiboard.c.s

src/CMakeFiles/wiiuse.dir/wiiboard.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/wiiboard.c.o.requires

src/CMakeFiles/wiiuse.dir/wiiboard.c.o.provides: src/CMakeFiles/wiiuse.dir/wiiboard.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/wiiboard.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/wiiboard.c.o.provides

src/CMakeFiles/wiiuse.dir/wiiboard.c.o.provides.build: src/CMakeFiles/wiiuse.dir/wiiboard.c.o

src/CMakeFiles/wiiuse.dir/motion_plus.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/motion_plus.c.o: ../src/motion_plus.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_10)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/motion_plus.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/motion_plus.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/motion_plus.c

src/CMakeFiles/wiiuse.dir/motion_plus.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/motion_plus.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/motion_plus.c > CMakeFiles/wiiuse.dir/motion_plus.c.i

src/CMakeFiles/wiiuse.dir/motion_plus.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/motion_plus.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/motion_plus.c -o CMakeFiles/wiiuse.dir/motion_plus.c.s

src/CMakeFiles/wiiuse.dir/motion_plus.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/motion_plus.c.o.requires

src/CMakeFiles/wiiuse.dir/motion_plus.c.o.provides: src/CMakeFiles/wiiuse.dir/motion_plus.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/motion_plus.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/motion_plus.c.o.provides

src/CMakeFiles/wiiuse.dir/motion_plus.c.o.provides.build: src/CMakeFiles/wiiuse.dir/motion_plus.c.o

src/CMakeFiles/wiiuse.dir/util.c.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/util.c.o: ../src/util.c
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_11)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/util.c.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/util.c.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/util.c

src/CMakeFiles/wiiuse.dir/util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/util.c.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/util.c > CMakeFiles/wiiuse.dir/util.c.i

src/CMakeFiles/wiiuse.dir/util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/util.c.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/util.c -o CMakeFiles/wiiuse.dir/util.c.s

src/CMakeFiles/wiiuse.dir/util.c.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/util.c.o.requires

src/CMakeFiles/wiiuse.dir/util.c.o.provides: src/CMakeFiles/wiiuse.dir/util.c.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/util.c.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/util.c.o.provides

src/CMakeFiles/wiiuse.dir/util.c.o.provides.build: src/CMakeFiles/wiiuse.dir/util.c.o

src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o: ../src/os_mac/os_mac.m
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_12)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/os_mac/os_mac.m

src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/os_mac/os_mac.m.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/os_mac/os_mac.m > CMakeFiles/wiiuse.dir/os_mac/os_mac.m.i

src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/os_mac/os_mac.m.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/os_mac/os_mac.m -o CMakeFiles/wiiuse.dir/os_mac/os_mac.m.s

src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o.requires

src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o.provides: src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o.provides

src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o.provides.build: src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o: ../src/os_mac/os_mac_interface.m
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_13)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/os_mac/os_mac_interface.m

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/os_mac/os_mac_interface.m > CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.i

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/os_mac/os_mac_interface.m -o CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.s

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o.requires

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o.provides: src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o.provides

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o.provides.build: src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o: src/CMakeFiles/wiiuse.dir/flags.make
src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o: ../src/os_mac/os_mac_find.m
	$(CMAKE_COMMAND) -E cmake_progress_report /Users/RobertGrande/Kinect/wiiuse2/build/CMakeFiles $(CMAKE_PROGRESS_14)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o   -c /Users/RobertGrande/Kinect/wiiuse2/src/os_mac/os_mac_find.m

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.i"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /Users/RobertGrande/Kinect/wiiuse2/src/os_mac/os_mac_find.m > CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.i

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.s"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && /usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /Users/RobertGrande/Kinect/wiiuse2/src/os_mac/os_mac_find.m -o CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.s

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o.requires:
.PHONY : src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o.requires

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o.provides: src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o.requires
	$(MAKE) -f src/CMakeFiles/wiiuse.dir/build.make src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o.provides.build
.PHONY : src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o.provides

src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o.provides.build: src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o

# Object files for target wiiuse
wiiuse_OBJECTS = \
"CMakeFiles/wiiuse.dir/classic.c.o" \
"CMakeFiles/wiiuse.dir/dynamics.c.o" \
"CMakeFiles/wiiuse.dir/events.c.o" \
"CMakeFiles/wiiuse.dir/guitar_hero_3.c.o" \
"CMakeFiles/wiiuse.dir/io.c.o" \
"CMakeFiles/wiiuse.dir/ir.c.o" \
"CMakeFiles/wiiuse.dir/nunchuk.c.o" \
"CMakeFiles/wiiuse.dir/wiiuse.c.o" \
"CMakeFiles/wiiuse.dir/wiiboard.c.o" \
"CMakeFiles/wiiuse.dir/motion_plus.c.o" \
"CMakeFiles/wiiuse.dir/util.c.o" \
"CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o" \
"CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o" \
"CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o"

# External object files for target wiiuse
wiiuse_EXTERNAL_OBJECTS =

src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/classic.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/dynamics.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/events.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/io.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/ir.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/nunchuk.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/wiiuse.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/wiiboard.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/motion_plus.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/util.c.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/build.make
src/libwiiuse.dylib: src/CMakeFiles/wiiuse.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C shared library libwiiuse.dylib"
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wiiuse.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/wiiuse.dir/build: src/libwiiuse.dylib
.PHONY : src/CMakeFiles/wiiuse.dir/build

src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/classic.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/dynamics.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/events.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/guitar_hero_3.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/io.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/ir.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/nunchuk.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/wiiuse.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/wiiboard.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/motion_plus.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/util.c.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/os_mac/os_mac.m.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/os_mac/os_mac_interface.m.o.requires
src/CMakeFiles/wiiuse.dir/requires: src/CMakeFiles/wiiuse.dir/os_mac/os_mac_find.m.o.requires
.PHONY : src/CMakeFiles/wiiuse.dir/requires

src/CMakeFiles/wiiuse.dir/clean:
	cd /Users/RobertGrande/Kinect/wiiuse2/build/src && $(CMAKE_COMMAND) -P CMakeFiles/wiiuse.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/wiiuse.dir/clean

src/CMakeFiles/wiiuse.dir/depend:
	cd /Users/RobertGrande/Kinect/wiiuse2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/RobertGrande/Kinect/wiiuse2 /Users/RobertGrande/Kinect/wiiuse2/src /Users/RobertGrande/Kinect/wiiuse2/build /Users/RobertGrande/Kinect/wiiuse2/build/src /Users/RobertGrande/Kinect/wiiuse2/build/src/CMakeFiles/wiiuse.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/wiiuse.dir/depend

