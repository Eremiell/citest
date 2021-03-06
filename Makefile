#!/usr/bin/make -f

name := "$(shell pwd | sed -E "s/.*\/([a-zA-Z0-9_-]*)/\1/")"
std := c++1z
warnflags := -Wall -Wextra -Wpedantic
binflags := -O2
dbgflags := -ggdb3 -Og
idirs := -I.
ldirs := 
bindefines := -UDEBUG
dbgdefines := -DDEBUG
staticdefines := -DSFML_STATIC
buildopts := 
linkflags := -lsfml-graphics -lsfml-window -lsfml-audio -lsfml-system -lstdc++fs
staticlinkflags := -lsfml-graphics-s -lsfml-window-s -lsfml-audio-s -lsfml-system-s -lstdc++fs -lGL -lfreetype -ljpeg -lopenal -lFLAC -lvorbisenc -lvorbisfile -lvorbis -logg -lxcb-image -lxcb-randr -lX11-xcb -lxcb -lXrandr -lX11 -lpthread
maclinkflags := -framework sfml-graphics -framework sfml-window -framework sfml-audio -framework sfml-system -lstdc++fs

gcc:
	mkdir -p bin
	g++ -std=${std} ${binflags} ${warnflags} ${idirs} ${ldirs} ${bindefines} ${buildopts} -o bin/${name} $(shell find src -iname "*.cpp") ${linkflags}
llvm:
	mkdir -p bin
	clang++ -std=${std} -stdlib=libc++ ${binflags} ${warnflags} ${idirs} ${ldirs} ${bindefines} ${buildopts} -o bin/${name} $(shell find src -iname "*.cpp") ${linkflags}
dbg:
	mkdir -p bin
	g++ -std=${std} ${dbgflags} ${warnflags} ${idirs} ${ldirs} ${dbgdefines} ${buildopts} -o bin/${name} $(shell find src -iname "*.cpp") ${linkflags}
lldbg:
	mkdir -p bin
	clang++ -std=${std} -stdlib=libc++ ${dbgflags} ${warnflags} ${idirs} ${ldirs} ${dbgdefines} ${buildopts} -o bin/${name} $(shell find src -iname "*.cpp") ${linkflags}
static:
	mkdir -p bin
	g++ -std=${std} ${binflags} ${warnflags} ${idirs} ${ldirs} ${bindefines} ${staticdefines} ${buildopts} -o bin/${name} $(shell find src -iname "*.cpp") -static ${staticlinkflags}
llstatic:
	mkdir -p bin
	clang++ -std=${std} -stdlib=libc++ ${binflags} ${warnflags} ${idirs} ${ldirs} ${bindefines} ${staticdefines} ${buildopts} -o bin/${name} $(shell find src -iname "*.cpp") -static ${staticlinkflags}
mac:
	mkdir -p bin
	clang++ --verbose -std=${std} -stdlib=libc++ ${binflags} ${warnflags} ${idirs} ${ldirs} ${bindefines} ${buildopts} -o bin/${name} $(shell find src -iname "*.cpp") ${maclinkflags}
clean:
	rm -rf bin
.PHONY:	bin clang dbg clangdbg clean