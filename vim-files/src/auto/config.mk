#
# config.mk.in -- autoconf template for Vim on Unix		vim:ts=8:sw=8:
#
# DO NOT EDIT config.mk!!  It will be overwritten by configure.
# Edit Makefile and run "make" or run ./configure with other arguments.
#
# Configure does not edit the makefile directly. This method is not the
# standard use of GNU autoconf, but it has two advantages:
#   a) The user can override every choice made by configure.
#   b) Modifications to the makefile are not lost when configure is run.
#
# I hope this is worth being nonstandard. jw.



VIMNAME		= vim
EXNAME		= ex
VIEWNAME	= view

CC		= gcc
DEFS		= -DHAVE_CONFIG_H
CFLAGS		= -g -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
CPPFLAGS	= 
srcdir		= .

LDFLAGS		= -L. -Wl,-z,relro -Wl,-z,now -fstack-protector-strong -rdynamic -Wl,-export-dynamic  -L/usr/local/lib -Wl,--as-needed
LIBS		= -lm -ltinfo   -ldl
TAGPRG		= ctags -I INIT+,INIT2+,INIT3+,INIT4+,INIT5+ --fields=+S

CPP		= gcc -E
CPP_MM		= M
DEPEND_CFLAGS_FILTER = | sed 's+-I */+-isystem /+g'
LINK_AS_NEEDED	= yes
X_CFLAGS	=  
X_LIBS_DIR	=  
X_PRE_LIBS	=  -lSM -lICE -lXpm
X_EXTRA_LIBS	=  -lXdmcp -lSM -lICE -ldl
X_LIBS		= -lXt -lX11

LUA_LIBS	= 
LUA_SRC		= 
LUA_OBJ		= 
LUA_CFLAGS	= 
LUA_PRO		= 

MZSCHEME_LIBS	= 
MZSCHEME_SRC	= 
MZSCHEME_OBJ	= 
MZSCHEME_CFLAGS	= 
MZSCHEME_PRO	= 
MZSCHEME_EXTRA	= 
MZSCHEME_MZC	= 

PERL		= /usr/bin/perl
PERLLIB		= /usr/share/perl/5.32
PERL_XSUBPP	= /usr/share/perl/5.32/ExtUtils/xsubpp
PERL_LIBS	= 
SHRPENV		= 
PERL_SRC	= 
PERL_OBJ	= 
PERL_PRO	= 
PERL_CFLAGS	= 

PYTHON_SRC	= 
PYTHON_OBJ	= 
PYTHON_CFLAGS	= 
PYTHON_LIBS	= 

PYTHON3_SRC	= if_python3.c
PYTHON3_OBJ	= objects/if_python3.o
PYTHON3_CFLAGS	= -I/usr/include/python3.9 -pthread -fPIE
PYTHON3_LIBS	= -L/usr/lib/python3.9/config-3.9-x86_64-linux-gnu -lpython3.9 -lcrypt -lpthread -ldl -lutil -lm -lm

TCL		= 
TCL_SRC		= 
TCL_OBJ		= 
TCL_PRO		= 
TCL_CFLAGS	= 
TCL_LIBS	= 

NETBEANS_SRC	= netbeans.c
NETBEANS_OBJ	= objects/netbeans.o
CHANNEL_SRC	= job.c channel.c
CHANNEL_OBJ	= objects/job.o objects/channel.o
TERM_SRC	= libvterm/src/encoding.c libvterm/src/keyboard.c libvterm/src/mouse.c libvterm/src/parser.c libvterm/src/pen.c libvterm/src/creen.c libvterm/src/state.c libvterm/src/unicode.c libvterm/src/vterm.c
TERM_OBJ	= objects/vterm_encoding.o objects/vterm_keyboard.o objects/vterm_mouse.o objects/vterm_parser.o objects/vterm_pen.o objects/vterm_screen.o objects/vterm_state.o objects/vterm_unicode.o objects/vterm_vterm.o
TERM_TEST	= test_libvterm

RUBY		= /usr/bin/ruby
RUBY_SRC	= if_ruby.c
RUBY_OBJ	= objects/if_ruby.o
RUBY_PRO	= if_ruby.pro
RUBY_CFLAGS	= -I/usr/include/ruby-2.7.0 -I/usr/include/x86_64-linux-gnu/ruby-2.7.0 -DRUBY_VERSION=27
RUBY_LIBS	= -lruby-2.7 -lm  -L/usr/lib

AWK		= gawk

STRIP		= strip

EXEEXT		= 
CROSS_COMPILING = 

COMPILEDBY	= 

INSTALLVIMDIFF	= installvimdiff
INSTALLGVIMDIFF	= installgvimdiff
INSTALL_LANGS	= install-languages
INSTALL_TOOL_LANGS	= install-tool-languages

### sed command to fix quotes while creating pathdef.c
QUOTESED        = sed -e 's/[\\"]/\\&/g' -e 's/\\"/"/' -e 's/\\";$$/";/' -e 's/  */ /g'

### Line break character as octal number for "tr"
NL		= "\\012"

### Top directory for everything
prefix		= /usr

### Top directory for the binary
exec_prefix	= ${prefix}

### Prefix for location of data files
BINDIR		= ${exec_prefix}/bin

### For autoconf 2.60 and later (avoid a warning)
datarootdir	= ${prefix}/share

### Prefix for location of data files
DATADIR		= ${datarootdir}

### Prefix for location of man pages
MANDIR		= ${datarootdir}/man

### Do we have a GUI
GUI_INC_LOC	= 
GUI_LIB_LOC	= 
GUI_SRC		= $(ATHENA_SRC)
GUI_OBJ		= $(ATHENA_OBJ)
GUI_DEFS	= $(ATHENA_DEFS)
GUI_IPATH	= $(ATHENA_IPATH)
GUI_LIBS_DIR	= $(ATHENA_LIBS_DIR)
GUI_LIBS1	= $(ATHENA_LIBS1)
GUI_LIBS2	= $(ATHENA_LIBS2)
GUI_INSTALL	= $(ATHENA_INSTALL)
GUI_TARGETS	= $(ATHENA_TARGETS)
GUI_MAN_TARGETS	= $(ATHENA_MAN_TARGETS)
GUI_TESTTARGET	= $(ATHENA_TESTTARGET)
GUI_TESTARG	= $(ATHENA_TESTARG)
GUI_BUNDLE	= $(ATHENA_BUNDLE)
NARROW_PROTO	= 
GUI_X_LIBS	= -lXmu -lXext
MOTIF_LIBNAME	= 
GTK_LIBNAME	= 

GLIB_COMPILE_RESOURCES = 
GRESOURCE_SRC = 
GRESOURCE_OBJ = 

GTK_UPDATE_ICON_CACHE = 
UPDATE_DESKTOP_DATABASE = 

### Any OS dependent extra source and object file
OS_EXTRA_SRC	= 
OS_EXTRA_OBJ	= 

### If the *.po files are to be translated to *.mo files.
MAKEMO		= 

MSGFMT		= 
MSGFMT_DESKTOP	= 

### set if $SOURCE_DATE_EPOCH was set when running configure
BUILD_DATE_MSG	= 


# Make sure that "make first" will run "make all" once configure has done its
# work.  This is needed when using the Makefile in the top directory.
first: all
