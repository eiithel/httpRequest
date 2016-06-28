#############################################################################
# Makefile for building: http
# Generated by qmake (2.01a) (Qt 4.8.7) on: Tue Jun 28 09:42:20 2016
# Project:  http.pro
# Template: app
# Command: /usr/lib/x86_64-linux-gnu/qt4/bin/qmake -o Makefile http.pro
#############################################################################

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_NO_DEBUG -DQT_GUI_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB -DQT_SHARED
CFLAGS        = -m64 -pipe -O2 -Wall -W -D_REENTRANT $(DEFINES)
CXXFLAGS      = -m64 -pipe -O2 -Wall -W -D_REENTRANT $(DEFINES)
INCPATH       = -I/usr/share/qt4/mkspecs/linux-g++-64 -I. -I/usr/include/qt4/QtCore -I/usr/include/qt4/QtNetwork -I/usr/include/qt4/QtGui -I/usr/include/qt4 -I. -I.
LINK          = g++
LFLAGS        = -m64 -Wl,-O1
LIBS          = $(SUBLIBS)  -L/usr/lib/x86_64-linux-gnu -lQtGui -lQtNetwork -lQtCore -lpthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /usr/lib/x86_64-linux-gnu/qt4/bin/qmake
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = httpwindow.cpp \
		main.cpp moc_httpwindow.cpp
OBJECTS       = httpwindow.o \
		main.o \
		moc_httpwindow.o
DIST          = forecast \
		/usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/common/gcc-base.conf \
		/usr/share/qt4/mkspecs/common/gcc-base-unix.conf \
		/usr/share/qt4/mkspecs/common/g++-base.conf \
		/usr/share/qt4/mkspecs/common/g++-unix.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_phonon.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/shared.prf \
		/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf \
		http.pro
QMAKE_TARGET  = http
DESTDIR       = 
TARGET        = http

first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile $(TARGET)

$(TARGET): ui_authenticationdialog.h $(OBJECTS)  
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)

Makefile: http.pro  /usr/share/qt4/mkspecs/linux-g++-64/qmake.conf /usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/common/gcc-base.conf \
		/usr/share/qt4/mkspecs/common/gcc-base-unix.conf \
		/usr/share/qt4/mkspecs/common/g++-base.conf \
		/usr/share/qt4/mkspecs/common/g++-unix.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_phonon.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/release.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/shared.prf \
		/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/share/qt4/mkspecs/features/include_source_dir.prf \
		/usr/lib/x86_64-linux-gnu/libQtGui.prl \
		/usr/lib/x86_64-linux-gnu/libQtNetwork.prl \
		/usr/lib/x86_64-linux-gnu/libQtCore.prl
	$(QMAKE) -o Makefile http.pro
/usr/share/qt4/mkspecs/common/unix.conf:
/usr/share/qt4/mkspecs/common/linux.conf:
/usr/share/qt4/mkspecs/common/gcc-base.conf:
/usr/share/qt4/mkspecs/common/gcc-base-unix.conf:
/usr/share/qt4/mkspecs/common/g++-base.conf:
/usr/share/qt4/mkspecs/common/g++-unix.conf:
/usr/share/qt4/mkspecs/qconfig.pri:
/usr/share/qt4/mkspecs/modules/qt_phonon.pri:
/usr/share/qt4/mkspecs/features/qt_functions.prf:
/usr/share/qt4/mkspecs/features/qt_config.prf:
/usr/share/qt4/mkspecs/features/exclusive_builds.prf:
/usr/share/qt4/mkspecs/features/default_pre.prf:
/usr/share/qt4/mkspecs/features/release.prf:
/usr/share/qt4/mkspecs/features/default_post.prf:
/usr/share/qt4/mkspecs/features/shared.prf:
/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf:
/usr/share/qt4/mkspecs/features/warn_on.prf:
/usr/share/qt4/mkspecs/features/qt.prf:
/usr/share/qt4/mkspecs/features/unix/thread.prf:
/usr/share/qt4/mkspecs/features/moc.prf:
/usr/share/qt4/mkspecs/features/resources.prf:
/usr/share/qt4/mkspecs/features/uic.prf:
/usr/share/qt4/mkspecs/features/yacc.prf:
/usr/share/qt4/mkspecs/features/lex.prf:
/usr/share/qt4/mkspecs/features/include_source_dir.prf:
/usr/lib/x86_64-linux-gnu/libQtGui.prl:
/usr/lib/x86_64-linux-gnu/libQtNetwork.prl:
/usr/lib/x86_64-linux-gnu/libQtCore.prl:
qmake:  FORCE
	@$(QMAKE) -o Makefile http.pro

dist: 
	@$(CHK_DIR_EXISTS) .tmp/http1.0.0 || $(MKDIR) .tmp/http1.0.0 
	$(COPY_FILE) --parents $(SOURCES) $(DIST) .tmp/http1.0.0/ && $(COPY_FILE) --parents httpwindow.h .tmp/http1.0.0/ && $(COPY_FILE) --parents httpwindow.cpp main.cpp .tmp/http1.0.0/ && $(COPY_FILE) --parents authenticationdialog.ui .tmp/http1.0.0/ && (cd `dirname .tmp/http1.0.0` && $(TAR) http1.0.0.tar http1.0.0 && $(COMPRESS) http1.0.0.tar) && $(MOVE) `dirname .tmp/http1.0.0`/http1.0.0.tar.gz . && $(DEL_FILE) -r .tmp/http1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


check: first

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all: moc_httpwindow.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc_httpwindow.cpp
moc_httpwindow.cpp: httpwindow.h
	/usr/lib/x86_64-linux-gnu/qt4/bin/moc $(DEFINES) $(INCPATH) httpwindow.h -o moc_httpwindow.cpp

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: ui_authenticationdialog.h
compiler_uic_clean:
	-$(DEL_FILE) ui_authenticationdialog.h
ui_authenticationdialog.h: authenticationdialog.ui
	/usr/lib/x86_64-linux-gnu/qt4/bin/uic authenticationdialog.ui -o ui_authenticationdialog.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_uic_clean 

####### Compile

httpwindow.o: httpwindow.cpp httpwindow.h \
		ui_authenticationdialog.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o httpwindow.o httpwindow.cpp

main.o: main.cpp httpwindow.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o main.o main.cpp

moc_httpwindow.o: moc_httpwindow.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_httpwindow.o moc_httpwindow.cpp

####### Install

install_target: first FORCE
	@$(CHK_DIR_EXISTS) $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/ || $(MKDIR) $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/ 
	-$(INSTALL_PROGRAM) "$(QMAKE_TARGET)" "$(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/$(QMAKE_TARGET)"
	-$(STRIP) "$(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/$(QMAKE_TARGET)"

uninstall_target:  FORCE
	-$(DEL_FILE) "$(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/$(QMAKE_TARGET)"
	-$(DEL_DIR) $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/ 


install_sources: first FORCE
	@$(CHK_DIR_EXISTS) $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/ || $(MKDIR) $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/ 
	-$(INSTALL_FILE) /home/ethel/qwt-5.2/test-ethel/network/httpwindow.cpp $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/
	-$(INSTALL_FILE) /home/ethel/qwt-5.2/test-ethel/network/main.cpp $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/
	-$(INSTALL_FILE) /home/ethel/qwt-5.2/test-ethel/network/httpwindow.h $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/
	-$(INSTALL_FILE) /home/ethel/qwt-5.2/test-ethel/network/authenticationdialog.ui $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/
	-$(INSTALL_FILE) /home/ethel/qwt-5.2/test-ethel/network/http.pro $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/


uninstall_sources:  FORCE
	-$(DEL_FILE) -r $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/httpwindow.cpp 
	 -$(DEL_FILE) -r $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/main.cpp 
	 -$(DEL_FILE) -r $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/httpwindow.h 
	 -$(DEL_FILE) -r $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/authenticationdialog.ui 
	 -$(DEL_FILE) -r $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/http.pro
	-$(DEL_DIR) $(INSTALL_ROOT)/usr/lib/qt4/examples/network/http/ 


install:  install_target install_sources  FORCE

uninstall: uninstall_target uninstall_sources   FORCE

FORCE:
