dnl aclocal.m4 generated automatically by aclocal 1.4a

dnl Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY, to the extent permitted by law; without
dnl even the implied warranty of MERCHANTABILITY or FITNESS FOR A
dnl PARTICULAR PURPOSE.

# Do all the work for Automake.  This macro actually does too much --
# some checks are only needed if your package does certain things.
# But this isn't really a big deal.

# serial 1

dnl Usage:
dnl AM_INIT_AUTOMAKE(package,version, [no-define])

AC_DEFUN(AM_INIT_AUTOMAKE,
[AC_REQUIRE([AC_PROG_INSTALL])
dnl We require 2.13 because we rely on SHELL being computed by configure.
AC_PREREQ([2.13])
PACKAGE=[$1]
AC_SUBST(PACKAGE)
VERSION=[$2]
AC_SUBST(VERSION)
dnl test to see if srcdir already configured
if test "`CDPATH=: && cd $srcdir && pwd`" != "`pwd`" &&
   test -f $srcdir/config.status; then
  AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
fi
ifelse([$3],,
AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE", [Name of package])
AC_DEFINE_UNQUOTED(VERSION, "$VERSION", [Version number of package]))
AC_REQUIRE([AM_SANITY_CHECK])
AC_REQUIRE([AC_ARG_PROGRAM])
AM_MISSING_PROG(ACLOCAL, aclocal)
AM_MISSING_PROG(AUTOCONF, autoconf)
AM_MISSING_PROG(AUTOMAKE, automake)
AM_MISSING_PROG(AUTOHEADER, autoheader)
AM_MISSING_PROG(MAKEINFO, makeinfo)
AM_MISSING_PROG(AMTAR, tar)
AM_MISSING_INSTALL_SH
dnl We need awk for the "check" target.  The system "awk" is bad on
dnl some platforms.
AC_REQUIRE([AC_PROG_AWK])
AC_REQUIRE([AC_PROG_MAKE_SET])
AC_REQUIRE([AM_DEP_TRACK])
AC_REQUIRE([AM_SET_DEPDIR])
ifdef([AC_PROVIDE_AC_PROG_CC], [AM_DEPENDENCIES(CC)], [
   define([AC_PROG_CC], defn([AC_PROG_CC])[AM_DEPENDENCIES(CC)])])
ifdef([AC_PROVIDE_AC_PROG_CXX], [AM_DEPENDENCIES(CXX)], [
   define([AC_PROG_CXX], defn([AC_PROG_CXX])[AM_DEPENDENCIES(CXX)])])
])

#
# Check to make sure that the build environment is sane.
#

AC_DEFUN(AM_SANITY_CHECK,
[AC_MSG_CHECKING([whether build environment is sane])
# Just in case
sleep 1
echo timestamp > conftestfile
# Do `set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   set X `ls -Lt $srcdir/configure conftestfile 2> /dev/null`
   if test "[$]*" = "X"; then
      # -L didn't work.
      set X `ls -t $srcdir/configure conftestfile`
   fi
   if test "[$]*" != "X $srcdir/configure conftestfile" \
      && test "[$]*" != "X conftestfile $srcdir/configure"; then

      # If neither matched, then we have a broken ls.  This can happen
      # if, for instance, CONFIG_SHELL is bash and it inherits a
      # broken ls alias from the environment.  This has actually
      # happened.  Such a system could not be considered "sane".
      AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
alias in your environment])
   fi

   test "[$]2" = conftestfile
   )
then
   # Ok.
   :
else
   AC_MSG_ERROR([newly created file is older than distributed files!
Check your system clock])
fi
rm -f conftest*
AC_MSG_RESULT(yes)])

dnl AM_MISSING_PROG(NAME, PROGRAM)
AC_DEFUN(AM_MISSING_PROG, [
AC_REQUIRE([AM_MISSING_HAS_RUN])
$1=${$1-"${am_missing_run}$2"}
AC_SUBST($1)])

dnl Like AM_MISSING_PROG, but only looks for install-sh.
dnl AM_MISSING_INSTALL_SH()
AC_DEFUN(AM_MISSING_INSTALL_SH, [
AC_REQUIRE([AM_MISSING_HAS_RUN])
if test -z "$install_sh"; then
   install_sh="$ac_aux_dir/install-sh"
   test -f "$install_sh" || install_sh="$ac_aux_dir/install.sh"
   test -f "$install_sh" || install_sh="${am_missing_run}${ac_auxdir}/install-sh"
   dnl FIXME: an evil hack: we remove the SHELL invocation from
   dnl install_sh because automake adds it back in.  Sigh.
   install_sh="`echo $install_sh | sed -e 's/\${SHELL}//'`"
fi
AC_SUBST(install_sh)])

dnl AM_MISSING_HAS_RUN.
dnl Define MISSING if not defined so far and test if it supports --run.
dnl If it does, set am_missing_run to use it, otherwise, to nothing.
AC_DEFUN([AM_MISSING_HAS_RUN], [
test x"${MISSING+set}" = xset || \
  MISSING="\${SHELL} `CDPATH=: && cd $ac_aux_dir && pwd`/missing"
dnl Use eval to expand $SHELL
if eval "$MISSING --run :"; then
  am_missing_run="$MISSING --run "
else
  am_missing_run=
  AC_MSG_WARN([`missing' script is too old or missing])
fi
])

dnl See how the compiler implements dependency checking.
dnl Usage:
dnl AM_DEPENDENCIES(NAME)
dnl NAME is "CC", "CXX" or "OBJC".

dnl We try a few techniques and use that to set a single cache variable.

AC_DEFUN(AM_DEPENDENCIES,[
AC_REQUIRE([AM_SET_DEPDIR])
AC_REQUIRE([AM_OUTPUT_DEPENDENCY_COMMANDS])
ifelse([$1],CC,[
AC_REQUIRE([AC_PROG_CC])
AC_REQUIRE([AC_PROG_CPP])
depcc="$CC"
depcpp="$CPP"],[$1],CXX,[
AC_REQUIRE([AC_PROG_CXX])
AC_REQUIRE([AC_PROG_CXXCPP])
depcc="$CXX"
depcpp="$CXXCPP"],[$1],OBJC,[
am_cv_OBJC_dependencies_compiler_type=gcc],[
AC_REQUIRE([AC_PROG_][$1])
depcc="$[$1]"
depcpp=""])
AC_MSG_CHECKING([dependency style of $depcc])
AC_CACHE_VAL(am_cv_[$1]_dependencies_compiler_type,[
if test -z "$AMDEP"; then
  echo '#include "conftest.h"' > conftest.c
  echo 'int i;' > conftest.h

  am_cv_[$1]_dependencies_compiler_type=none
  for depmode in `sed -n 's/^#*\([a-zA-Z0-9]*\))$/\1/p' < "$am_depcomp"`; do
    case "$depmode" in
    nosideeffect)
      # after this tag, mechanisms are not by side-effect, so they'll
      # only be used when explicitly requested
      if test "x$enable_dependency_tracking" = xyes; then
	continue
      else
	break
      fi
      ;;
    none) break ;;
    esac
    if depmode="$depmode" \
       source=conftest.c object=conftest.o \
       depfile=conftest.Po tmpdepfile=conftest.TPo \
       $SHELL $am_depcomp $depcc -c conftest.c 2>/dev/null &&
       grep conftest.h conftest.Po > /dev/null 2>&1; then
      am_cv_[$1]_dependencies_compiler_type="$depmode"
      break
    fi
  done

  rm -f conftest.*
else
  am_cv_[$1]_dependencies_compiler_type=none
fi
])
AC_MSG_RESULT($am_cv_[$1]_dependencies_compiler_type)
[$1]DEPMODE="depmode=$am_cv_[$1]_dependencies_compiler_type"
AC_SUBST([$1]DEPMODE)
])

dnl Choose a directory name for dependency files.
dnl This macro is AC_REQUIREd in AM_DEPENDENCIES

AC_DEFUN(AM_SET_DEPDIR,[
if test -d .deps || mkdir .deps 2> /dev/null || test -d .deps; then
  DEPDIR=.deps
else
  DEPDIR=_deps
fi
AC_SUBST(DEPDIR)
])

AC_DEFUN(AM_DEP_TRACK,[
AC_ARG_ENABLE(dependency-tracking,
[  --disable-dependency-tracking Speeds up one-time builds
  --enable-dependency-tracking  Do not reject slow dependency extractors])
if test "x$enable_dependency_tracking" = xno; then
  AMDEP="#"
else
  am_depcomp="$ac_aux_dir/depcomp"
  if test ! -f "$am_depcomp"; then
    AMDEP="#"
  else
    AMDEP=
  fi
fi
AC_SUBST(AMDEP)
if test -z "$AMDEP"; then
  AMDEPBACKSLASH='\'
else
  AMDEPBACKSLASH=
fi
pushdef([subst], defn([AC_SUBST]))
subst(AMDEPBACKSLASH)
popdef([subst])
])

dnl Generate code to set up dependency tracking.
dnl This macro should only be invoked once -- use via AC_REQUIRE.
dnl Usage:
dnl AM_OUTPUT_DEPENDENCY_COMMANDS

dnl
dnl This code is only required when automatic dependency tracking
dnl is enabled.  FIXME.  This creates each `.P' file that we will
dnl need in order to bootstrap the dependency handling code.
AC_DEFUN(AM_OUTPUT_DEPENDENCY_COMMANDS,[
AC_OUTPUT_COMMANDS([
test x"$AMDEP" != x"" ||
for mf in $CONFIG_FILES; do
  case "$mf" in
  Makefile) dirpart=.;;
  */Makefile) dirpart=`echo "$mf" | sed -e 's|/[^/]*$||'`;;
  *) continue;;
  esac
  grep '^DEP_FILES *= *[^ #]' < "$mf" > /dev/null || continue
  # Extract the definition of DEP_FILES from the Makefile without
  # running `make'.
  DEPDIR=`sed -n -e '/^DEPDIR = / s///p' < "$mf"`
  test -z "$DEPDIR" && continue
  # When using ansi2knr, U may be empty or an underscore; expand it
  U=`sed -n -e '/^U = / s///p' < "$mf"`
  test -d "$dirpart/$DEPDIR" || mkdir "$dirpart/$DEPDIR"
  # We invoke sed twice because it is the simplest approach to
  # changing $(DEPDIR) to its actual value in the expansion.
  for file in `sed -n -e '
    /^DEP_FILES = .*\\\\$/ {
      s/^DEP_FILES = //
      :loop
	s/\\\\$//
	p
	n
	/\\\\$/ b loop
      p
    }
    /^DEP_FILES = / s/^DEP_FILES = //p' < "$mf" | \
       sed -e 's/\$(DEPDIR)/'"$DEPDIR"'/g' -e 's/\$U/'"$U"'/g'`; do
    # Make sure the directory exists.
    test -f "$dirpart/$file" && continue
    fdir=`echo "$file" | sed -e 's|/[^/]*$||'`
    $ac_aux_dir/mkinstalldirs "$dirpart/$fdir" > /dev/null 2>&1
    # echo "creating $dirpart/$file"
    echo '# dummy' > "$dirpart/$file"
  done
done
], [AMDEP="$AMDEP"
ac_aux_dir="$ac_aux_dir"])])

# Like AC_CONFIG_HEADER, but automatically create stamp file.

AC_DEFUN(AM_CONFIG_HEADER,
[AC_PREREQ([2.12])
AC_CONFIG_HEADER([$1])
dnl When config.status generates a header, we must update the stamp-h file.
dnl This file resides in the same directory as the config header
dnl that is generated.  We must strip everything past the first ":",
dnl and everything past the last "/".
AC_OUTPUT_COMMANDS(changequote(<<,>>)dnl
ifelse(patsubst(<<$1>>, <<[^ ]>>, <<>>), <<>>,
<<test -z "<<$>>CONFIG_HEADERS" || echo timestamp > patsubst(<<$1>>, <<^\([^:]*/\)?.*>>, <<\1>>)stamp-h<<>>dnl>>,
<<am_indx=1
for am_file in <<$1>>; do
  case " <<$>>CONFIG_HEADERS " in
  *" <<$>>am_file "*<<)>>
    echo timestamp > `echo <<$>>am_file | sed -e 's%:.*%%' -e 's%[^/]*$%%'`stamp-h$am_indx
    ;;
  esac
  am_indx=`expr "<<$>>am_indx" + 1`
done<<>>dnl>>)
changequote([,]))])


# serial 40 AC_PROG_LIBTOOL
AC_DEFUN(AC_PROG_LIBTOOL,
[AC_REQUIRE([AC_LIBTOOL_SETUP])dnl

# Save cache, so that ltconfig can load it
AC_CACHE_SAVE

# Actually configure libtool.  ac_aux_dir is where install-sh is found.
CC="$CC" CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS" \
LD="$LD" LDFLAGS="$LDFLAGS" LIBS="$LIBS" \
LN_S="$LN_S" NM="$NM" RANLIB="$RANLIB" \
DLLTOOL="$DLLTOOL" AS="$AS" OBJDUMP="$OBJDUMP" \
${CONFIG_SHELL-/bin/sh} $ac_aux_dir/ltconfig --no-reexec \
$libtool_flags --no-verify $ac_aux_dir/ltmain.sh $lt_target \
|| AC_MSG_ERROR([libtool configure failed])

# Reload cache, that may have been modified by ltconfig
AC_CACHE_LOAD

# This can be used to rebuild libtool when needed
LIBTOOL_DEPS="$ac_aux_dir/ltconfig $ac_aux_dir/ltmain.sh"

# Always use our own libtool.
LIBTOOL='$(SHELL) $(top_builddir)/libtool'
AC_SUBST(LIBTOOL)dnl

# Redirect the config.log output again, so that the ltconfig log is not
# clobbered by the next message.
exec 5>>./config.log
])

AC_DEFUN(AC_LIBTOOL_SETUP,
[AC_PREREQ(2.13)dnl
AC_REQUIRE([AC_ENABLE_SHARED])dnl
AC_REQUIRE([AC_ENABLE_STATIC])dnl
AC_REQUIRE([AC_ENABLE_FAST_INSTALL])dnl
AC_REQUIRE([AC_CANONICAL_HOST])dnl
AC_REQUIRE([AC_CANONICAL_BUILD])dnl
AC_REQUIRE([AC_PROG_RANLIB])dnl
AC_REQUIRE([AC_PROG_CC])dnl
AC_REQUIRE([AC_PROG_LD])dnl
AC_REQUIRE([AC_PROG_NM])dnl
AC_REQUIRE([AC_PROG_LN_S])dnl
dnl

case "$target" in
NONE) lt_target="$host" ;;
*) lt_target="$target" ;;
esac

# Check for any special flags to pass to ltconfig.
libtool_flags="--cache-file=$cache_file"
test "$enable_shared" = no && libtool_flags="$libtool_flags --disable-shared"
test "$enable_static" = no && libtool_flags="$libtool_flags --disable-static"
test "$enable_fast_install" = no && libtool_flags="$libtool_flags --disable-fast-install"
test "$ac_cv_prog_gcc" = yes && libtool_flags="$libtool_flags --with-gcc"
test "$ac_cv_prog_gnu_ld" = yes && libtool_flags="$libtool_flags --with-gnu-ld"
ifdef([AC_PROVIDE_AC_LIBTOOL_DLOPEN],
[libtool_flags="$libtool_flags --enable-dlopen"])
ifdef([AC_PROVIDE_AC_LIBTOOL_WIN32_DLL],
[libtool_flags="$libtool_flags --enable-win32-dll"])
AC_ARG_ENABLE(libtool-lock,
  [  --disable-libtool-lock  avoid locking (might break parallel builds)])
test "x$enable_libtool_lock" = xno && libtool_flags="$libtool_flags --disable-lock"
test x"$silent" = xyes && libtool_flags="$libtool_flags --silent"

# Some flags need to be propagated to the compiler or linker for good
# libtool support.
case "$lt_target" in
*-*-irix6*)
  # Find out which ABI we are using.
  echo '[#]line __oline__ "configure"' > conftest.$ac_ext
  if AC_TRY_EVAL(ac_compile); then
    case "`/usr/bin/file conftest.o`" in
    *32-bit*)
      LD="${LD-ld} -32"
      ;;
    *N32*)
      LD="${LD-ld} -n32"
      ;;
    *64-bit*)
      LD="${LD-ld} -64"
      ;;
    esac
  fi
  rm -rf conftest*
  ;;

*-*-sco3.2v5*)
  # On SCO OpenServer 5, we need -belf to get full-featured binaries.
  SAVE_CFLAGS="$CFLAGS"
  CFLAGS="$CFLAGS -belf"
  AC_CACHE_CHECK([whether the C compiler needs -belf], lt_cv_cc_needs_belf,
    [AC_TRY_LINK([],[],[lt_cv_cc_needs_belf=yes],[lt_cv_cc_needs_belf=no])])
  if test x"$lt_cv_cc_needs_belf" != x"yes"; then
    # this is probably gcc 2.8.0, egcs 1.0 or newer; no need for -belf
    CFLAGS="$SAVE_CFLAGS"
  fi
  ;;

ifdef([AC_PROVIDE_AC_LIBTOOL_WIN32_DLL],
[*-*-cygwin* | *-*-mingw*)
  AC_CHECK_TOOL(DLLTOOL, dlltool, false)
  AC_CHECK_TOOL(AS, as, false)
  AC_CHECK_TOOL(OBJDUMP, objdump, false)
  ;;
])
esac
])

# AC_LIBTOOL_DLOPEN - enable checks for dlopen support
AC_DEFUN(AC_LIBTOOL_DLOPEN, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])])

# AC_LIBTOOL_WIN32_DLL - declare package support for building win32 dll's
AC_DEFUN(AC_LIBTOOL_WIN32_DLL, [AC_BEFORE([$0], [AC_LIBTOOL_SETUP])])

# AC_ENABLE_SHARED - implement the --enable-shared flag
# Usage: AC_ENABLE_SHARED[(DEFAULT)]
#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
#   `yes'.
AC_DEFUN(AC_ENABLE_SHARED, [dnl
define([AC_ENABLE_SHARED_DEFAULT], ifelse($1, no, no, yes))dnl
AC_ARG_ENABLE(shared,
changequote(<<, >>)dnl
<<  --enable-shared[=PKGS]  build shared libraries [default=>>AC_ENABLE_SHARED_DEFAULT],
changequote([, ])dnl
[p=${PACKAGE-default}
case "$enableval" in
yes) enable_shared=yes ;;
no) enable_shared=no ;;
*)
  enable_shared=no
  # Look at the argument we got.  We use all the common list separators.
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
  for pkg in $enableval; do
    if test "X$pkg" = "X$p"; then
      enable_shared=yes
    fi
  done
  IFS="$ac_save_ifs"
  ;;
esac],
enable_shared=AC_ENABLE_SHARED_DEFAULT)dnl
])

# AC_DISABLE_SHARED - set the default shared flag to --disable-shared
AC_DEFUN(AC_DISABLE_SHARED, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
AC_ENABLE_SHARED(no)])

# AC_ENABLE_STATIC - implement the --enable-static flag
# Usage: AC_ENABLE_STATIC[(DEFAULT)]
#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
#   `yes'.
AC_DEFUN(AC_ENABLE_STATIC, [dnl
define([AC_ENABLE_STATIC_DEFAULT], ifelse($1, no, no, yes))dnl
AC_ARG_ENABLE(static,
changequote(<<, >>)dnl
<<  --enable-static[=PKGS]  build static libraries [default=>>AC_ENABLE_STATIC_DEFAULT],
changequote([, ])dnl
[p=${PACKAGE-default}
case "$enableval" in
yes) enable_static=yes ;;
no) enable_static=no ;;
*)
  enable_static=no
  # Look at the argument we got.  We use all the common list separators.
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
  for pkg in $enableval; do
    if test "X$pkg" = "X$p"; then
      enable_static=yes
    fi
  done
  IFS="$ac_save_ifs"
  ;;
esac],
enable_static=AC_ENABLE_STATIC_DEFAULT)dnl
])

# AC_DISABLE_STATIC - set the default static flag to --disable-static
AC_DEFUN(AC_DISABLE_STATIC, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
AC_ENABLE_STATIC(no)])


# AC_ENABLE_FAST_INSTALL - implement the --enable-fast-install flag
# Usage: AC_ENABLE_FAST_INSTALL[(DEFAULT)]
#   Where DEFAULT is either `yes' or `no'.  If omitted, it defaults to
#   `yes'.
AC_DEFUN(AC_ENABLE_FAST_INSTALL, [dnl
define([AC_ENABLE_FAST_INSTALL_DEFAULT], ifelse($1, no, no, yes))dnl
AC_ARG_ENABLE(fast-install,
changequote(<<, >>)dnl
<<  --enable-fast-install[=PKGS]  optimize for fast installation [default=>>AC_ENABLE_FAST_INSTALL_DEFAULT],
changequote([, ])dnl
[p=${PACKAGE-default}
case "$enableval" in
yes) enable_fast_install=yes ;;
no) enable_fast_install=no ;;
*)
  enable_fast_install=no
  # Look at the argument we got.  We use all the common list separators.
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:,"
  for pkg in $enableval; do
    if test "X$pkg" = "X$p"; then
      enable_fast_install=yes
    fi
  done
  IFS="$ac_save_ifs"
  ;;
esac],
enable_fast_install=AC_ENABLE_FAST_INSTALL_DEFAULT)dnl
])

# AC_ENABLE_FAST_INSTALL - set the default to --disable-fast-install
AC_DEFUN(AC_DISABLE_FAST_INSTALL, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
AC_ENABLE_FAST_INSTALL(no)])

# AC_PROG_LD - find the path to the GNU or non-GNU linker
AC_DEFUN(AC_PROG_LD,
[AC_ARG_WITH(gnu-ld,
[  --with-gnu-ld           assume the C compiler uses GNU ld [default=no]],
test "$withval" = no || with_gnu_ld=yes, with_gnu_ld=no)
AC_REQUIRE([AC_PROG_CC])dnl
AC_REQUIRE([AC_CANONICAL_HOST])dnl
AC_REQUIRE([AC_CANONICAL_BUILD])dnl
ac_prog=ld
if test "$ac_cv_prog_gcc" = yes; then
  # Check if gcc -print-prog-name=ld gives a path.
  AC_MSG_CHECKING([for ld used by GCC])
  ac_prog=`($CC -print-prog-name=ld) 2>&5`
  case "$ac_prog" in
    # Accept absolute paths.
changequote(,)dnl
    [\\/]* | [A-Za-z]:[\\/]*)
      re_direlt='/[^/][^/]*/\.\./'
changequote([,])dnl
      # Canonicalize the path of ld
      ac_prog=`echo $ac_prog| sed 's%\\\\%/%g'`
      while echo $ac_prog | grep "$re_direlt" > /dev/null 2>&1; do
	ac_prog=`echo $ac_prog| sed "s%$re_direlt%/%"`
      done
      test -z "$LD" && LD="$ac_prog"
      ;;
  "")
    # If it fails, then pretend we aren't using GCC.
    ac_prog=ld
    ;;
  *)
    # If it is relative, then search for the first ld in PATH.
    with_gnu_ld=unknown
    ;;
  esac
elif test "$with_gnu_ld" = yes; then
  AC_MSG_CHECKING([for GNU ld])
else
  AC_MSG_CHECKING([for non-GNU ld])
fi
AC_CACHE_VAL(ac_cv_path_LD,
[if test -z "$LD"; then
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}${PATH_SEPARATOR-:}"
  for ac_dir in $PATH; do
    test -z "$ac_dir" && ac_dir=.
    if test -f "$ac_dir/$ac_prog" || test -f "$ac_dir/$ac_prog$ac_exeext"; then
      ac_cv_path_LD="$ac_dir/$ac_prog"
      # Check to see if the program is GNU ld.  I'd rather use --version,
      # but apparently some GNU ld's only accept -v.
      # Break only if it was the GNU/non-GNU ld that we prefer.
      if "$ac_cv_path_LD" -v 2>&1 < /dev/null | egrep '(GNU|with BFD)' > /dev/null; then
	test "$with_gnu_ld" != no && break
      else
	test "$with_gnu_ld" != yes && break
      fi
    fi
  done
  IFS="$ac_save_ifs"
else
  ac_cv_path_LD="$LD" # Let the user override the test with a path.
fi])
LD="$ac_cv_path_LD"
if test -n "$LD"; then
  AC_MSG_RESULT($LD)
else
  AC_MSG_RESULT(no)
fi
test -z "$LD" && AC_MSG_ERROR([no acceptable ld found in \$PATH])
AC_PROG_LD_GNU
])

AC_DEFUN(AC_PROG_LD_GNU,
[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], ac_cv_prog_gnu_ld,
[# I'd rather use --version here, but apparently some GNU ld's only accept -v.
if $LD -v 2>&1 </dev/null | egrep '(GNU|with BFD)' 1>&5; then
  ac_cv_prog_gnu_ld=yes
else
  ac_cv_prog_gnu_ld=no
fi])
])

# AC_PROG_NM - find the path to a BSD-compatible name lister
AC_DEFUN(AC_PROG_NM,
[AC_MSG_CHECKING([for BSD-compatible nm])
AC_CACHE_VAL(ac_cv_path_NM,
[if test -n "$NM"; then
  # Let the user override the test.
  ac_cv_path_NM="$NM"
else
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}${PATH_SEPARATOR-:}"
  for ac_dir in $PATH /usr/ccs/bin /usr/ucb /bin; do
    test -z "$ac_dir" && ac_dir=.
    if test -f $ac_dir/nm || test -f $ac_dir/nm$ac_exeext ; then
      # Check to see if the nm accepts a BSD-compat flag.
      # Adding the `sed 1q' prevents false positives on HP-UX, which says:
      #   nm: unknown option "B" ignored
      if ($ac_dir/nm -B /dev/null 2>&1 | sed '1q'; exit 0) | egrep /dev/null >/dev/null; then
	ac_cv_path_NM="$ac_dir/nm -B"
	break
      elif ($ac_dir/nm -p /dev/null 2>&1 | sed '1q'; exit 0) | egrep /dev/null >/dev/null; then
	ac_cv_path_NM="$ac_dir/nm -p"
	break
      else
	ac_cv_path_NM=${ac_cv_path_NM="$ac_dir/nm"} # keep the first match, but
	continue # so that we can try to find one that supports BSD flags
      fi
    fi
  done
  IFS="$ac_save_ifs"
  test -z "$ac_cv_path_NM" && ac_cv_path_NM=nm
fi])
NM="$ac_cv_path_NM"
AC_MSG_RESULT([$NM])
])

# AC_CHECK_LIBM - check for math library
AC_DEFUN(AC_CHECK_LIBM,
[AC_REQUIRE([AC_CANONICAL_HOST])dnl
LIBM=
case "$lt_target" in
*-*-beos* | *-*-cygwin*)
  # These system don't have libm
  ;;
*-ncr-sysv4.3*)
  AC_CHECK_LIB(mw, _mwvalidcheckl, LIBM="-lmw")
  AC_CHECK_LIB(m, main, LIBM="$LIBM -lm")
  ;;
*)
  AC_CHECK_LIB(m, main, LIBM="-lm")
  ;;
esac
])

# AC_LIBLTDL_CONVENIENCE[(dir)] - sets LIBLTDL to the link flags for
# the libltdl convenience library, adds --enable-ltdl-convenience to
# the configure arguments.  Note that LIBLTDL is not AC_SUBSTed, nor
# is AC_CONFIG_SUBDIRS called.  If DIR is not provided, it is assumed
# to be `${top_builddir}/libltdl'.  Make sure you start DIR with
# '${top_builddir}/' (note the single quotes!) if your package is not
# flat, and, if you're not using automake, define top_builddir as
# appropriate in the Makefiles.
AC_DEFUN(AC_LIBLTDL_CONVENIENCE, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
  case "$enable_ltdl_convenience" in
  no) AC_MSG_ERROR([this package needs a convenience libltdl]) ;;
  "") enable_ltdl_convenience=yes
      ac_configure_args="$ac_configure_args --enable-ltdl-convenience" ;;
  esac
  LIBLTDL=ifelse($#,1,$1,['${top_builddir}/libltdl'])/libltdlc.la
  INCLTDL=ifelse($#,1,-I$1,['-I${top_builddir}/libltdl'])
])

# AC_LIBLTDL_INSTALLABLE[(dir)] - sets LIBLTDL to the link flags for
# the libltdl installable library, and adds --enable-ltdl-install to
# the configure arguments.  Note that LIBLTDL is not AC_SUBSTed, nor
# is AC_CONFIG_SUBDIRS called.  If DIR is not provided, it is assumed
# to be `${top_builddir}/libltdl'.  Make sure you start DIR with
# '${top_builddir}/' (note the single quotes!) if your package is not
# flat, and, if you're not using automake, define top_builddir as
# appropriate in the Makefiles.
# In the future, this macro may have to be called after AC_PROG_LIBTOOL.
AC_DEFUN(AC_LIBLTDL_INSTALLABLE, [AC_BEFORE([$0],[AC_LIBTOOL_SETUP])dnl
  AC_CHECK_LIB(ltdl, main,
  [test x"$enable_ltdl_install" != xyes && enable_ltdl_install=no],
  [if test x"$enable_ltdl_install" = xno; then
     AC_MSG_WARN([libltdl not installed, but installation disabled])
   else
     enable_ltdl_install=yes
   fi
  ])
  if test x"$enable_ltdl_install" = x"yes"; then
    ac_configure_args="$ac_configure_args --enable-ltdl-install"
    LIBLTDL=ifelse($#,1,$1,['${top_builddir}/libltdl'])/libltdl.la
    INCLTDL=ifelse($#,1,-I$1,['-I${top_builddir}/libltdl'])
  else
    ac_configure_args="$ac_configure_args --enable-ltdl-install=no"
    LIBLTDL="-lltdl"
    INCLTDL=
  fi
])

dnl old names
AC_DEFUN(AM_PROG_LIBTOOL, [indir([AC_PROG_LIBTOOL])])dnl
AC_DEFUN(AM_ENABLE_SHARED, [indir([AC_ENABLE_SHARED], $@)])dnl
AC_DEFUN(AM_ENABLE_STATIC, [indir([AC_ENABLE_STATIC], $@)])dnl
AC_DEFUN(AM_DISABLE_SHARED, [indir([AC_DISABLE_SHARED], $@)])dnl
AC_DEFUN(AM_DISABLE_STATIC, [indir([AC_DISABLE_STATIC], $@)])dnl
AC_DEFUN(AM_PROG_LD, [indir([AC_PROG_LD])])dnl
AC_DEFUN(AM_PROG_NM, [indir([AC_PROG_NM])])dnl

dnl This is just to silence aclocal about the macro not being used
ifelse([AC_DISABLE_FAST_INSTALL])dnl

# Add --enable-maintainer-mode option to configure.
# From Jim Meyering

# serial 1

AC_DEFUN(AM_MAINTAINER_MODE,
[AC_MSG_CHECKING([whether to enable maintainer-specific portions of Makefiles])
  dnl maintainer-mode is disabled by default
  AC_ARG_ENABLE(maintainer-mode,
[  --enable-maintainer-mode enable make rules and dependencies not useful
                          (and sometimes confusing) to the casual installer],
      USE_MAINTAINER_MODE=$enableval,
      USE_MAINTAINER_MODE=no)
  AC_MSG_RESULT($USE_MAINTAINER_MODE)
  AM_CONDITIONAL(MAINTAINER_MODE, test $USE_MAINTAINER_MODE = yes)
  MAINT=$MAINTAINER_MODE_TRUE
  AC_SUBST(MAINT)dnl
]
)

# Define a conditional.

AC_DEFUN(AM_CONDITIONAL,
[AC_SUBST($1_TRUE)
AC_SUBST($1_FALSE)
if $2; then
  $1_TRUE=
  $1_FALSE='#'
else
  $1_TRUE='#'
  $1_FALSE=
fi])

dnl Usage:
dnl  SIM_CHECK_DL([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to find the dynamic link loader library. If it is found, these
dnl  shell variables are set:
dnl
dnl    $sim_ac_dl_cppflags (extra flags the compiler needs for dl lib)
dnl    $sim_ac_dl_ldflags  (extra flags the linker needs for dl lib)
dnl    $sim_ac_dl_libs     (link libraries the linker needs for dl lib)
dnl
dnl  The CPPFLAGS, LDFLAGS and LIBS flags will also be modified accordingly.
dnl  In addition, the variable $sim_ac_dl_avail is set to "yes" if
dnl  the dynamic link loader library is found.
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl TODO:
dnl    * [mortene:20000122] make sure this work on MSWin (with
dnl      Cygwin installation)
dnl

AC_DEFUN(SIM_CHECK_DL,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

AC_ARG_WITH(dl, AC_HELP_STRING([--with-dl=DIR], [include support for the dynamic link loader library [default=yes]]), , [with_dl=yes])

sim_ac_dl_avail=no

if test x"$with_dl" != xno; then
  if test x"$with_dl" != xyes; then
    sim_ac_dl_cppflags="-I${with_dl}/include"
    sim_ac_dl_ldflags="-L${with_dl}/lib"
  fi
  sim_ac_dl_libs="-ldl"

  sim_ac_save_cppflags=$CPPFLAGS
  sim_ac_save_ldflags=$LDFLAGS
  sim_ac_save_libs=$LIBS

  CPPFLAGS="$CPPFLAGS $sim_ac_dl_cppflags"
  LDFLAGS="$LDFLAGS $sim_ac_dl_ldflags"
  LIBS="$sim_ac_dl_libs $LIBS"

  AC_CACHE_CHECK([whether the dynamic link loader library is available],
    sim_cv_lib_dl_avail,
    [AC_TRY_LINK([#include <dlfcn.h>],
                 [(void)dlopen(0L, 0);],
                 sim_cv_lib_dl_avail=yes,
                 sim_cv_lib_dl_avail=no)])

  if test x"$sim_cv_lib_dl_avail" = xyes; then
    sim_ac_dl_avail=yes
    ifelse($1, , :, $1)
  else
    CPPFLAGS=$sim_ac_save_cppflags
    LDFLAGS=$sim_ac_save_ldflags
    LIBS=$sim_ac_save_libs
    ifelse($2, , :, $2)
  fi
fi
])

dnl Usage:
dnl  SIM_CHECK_X11([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to find the X11 development system. If it is found, these
dnl  shell variables are set:
dnl
dnl    $sim_ac_x11_cppflags (extra flags the compiler needs for X11)
dnl    $sim_ac_x11_ldflags  (extra flags the linker needs for X11)
dnl    $sim_ac_x11_libs     (link libraries the linker needs for X11)
dnl
dnl  The CPPFLAGS, LDFLAGS and LIBS flags will also be modified accordingly.
dnl  In addition, the variable $sim_ac_x11_avail is set to "yes" if
dnl  the X11 development system is found.
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl TODO:
dnl    * [mortene:20000122] make sure this work on MSWin (with
dnl      Cygwin installation)
dnl

AC_DEFUN(SIM_CHECK_X11,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

sim_ac_x11_avail=no

AC_PATH_XTRA

if test x"$no_x" != xyes; then
  #  *** DEBUG ***
  #  Keep this around, as it can be handy when testing on new systems.
  # echo "X_CFLAGS: $X_CFLAGS"
  # echo "X_PRE_LIBS: $X_PRE_LIBS"
  # echo "X_LIBS: $X_LIBS"
  # echo "X_EXTRA_LIBS: $X_EXTRA_LIBS"
  # echo
  # echo "CFLAGS: $CFLAGS"
  # echo "CPPFLAGS: $CPPFLAGS"
  # echo "CXXFLAGS: $CXXFLAGS"
  # echo "LDFLAGS: $LDFLAGS"
  # echo "LIBS: $LIBS"
  # exit 0

  sim_ac_x11_cppflags="$X_CFLAGS"
  sim_ac_x11_ldflags="$X_LIBS"
  sim_ac_x11_libs="$X_PRE_LIBS -lX11 $X_EXTRA_LIBS"

  sim_ac_save_cppflags=$CPPFLAGS
  sim_ac_save_ldflags=$LDFLAGS
  sim_ac_save_libs=$LIBS

  CPPFLAGS="$CPPFLAGS $sim_ac_x11_cppflags"
  LDFLAGS="$LDFLAGS $sim_ac_x11_ldflags"
  LIBS="$sim_ac_x11_libs $LIBS"

  AC_CACHE_CHECK([whether we can link against X11],
    sim_cv_lib_x11_avail,
    [AC_TRY_LINK([#include <X11/Xlib.h>],
                 [(void)XOpenDisplay(0L);],
                 sim_cv_lib_x11_avail=yes,
                 sim_cv_lib_x11_avail=no)])

  if test x"$sim_cv_lib_x11_avail" = xyes; then
    sim_ac_x11_avail=yes
    ifelse($1, , :, $1)
  else
    CPPFLAGS=$sim_ac_save_cppflags
    LDFLAGS=$sim_ac_save_ldflags
    LIBS=$sim_ac_save_libs
    ifelse($2, , :, $2)
  fi
fi
])


dnl Usage:
dnl  SIM_CHECK_X11SHMEM([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to find the X11 shared memory extension. If it is found, this
dnl  shell variable is set:
dnl
dnl    $sim_ac_x11shmem_libs   (link libraries the linker needs for X11 Shm)
dnl
dnl  The LIBS flag will also be modified accordingly. In addition, the
dnl  variable $sim_ac_x11shmem_avail is set to "yes" if the X11 shared
dnl  memory extension is found.
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl TODO:
dnl    * [mortene:20000122] make sure this work on MSWin (with
dnl      Cygwin installation)
dnl

AC_DEFUN(SIM_CHECK_X11SHMEM,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

sim_ac_x11shmem_avail=no
sim_ac_x11shmem_libs="-lXext"
sim_ac_save_libs=$LIBS
LIBS="$sim_ac_x11shmem_libs $LIBS"

AC_CACHE_CHECK([whether the X11 shared memory extension is available],
  sim_cv_lib_x11shmem_avail,
  [AC_TRY_LINK([#include <X11/Xlib.h>
                #include <X11/extensions/XShm.h>],
               [(void)XShmQueryVersion(0L, 0L, 0L, 0L);],
               sim_cv_lib_x11shmem_avail=yes,
               sim_cv_lib_x11shmem_avail=no)])

if test x"$sim_cv_lib_x11shmem_avail" = xyes; then
  sim_ac_x11shmem_avail=yes
  ifelse($1, , :, $1)
else
  LIBS=$sim_ac_save_libs
  ifelse($2, , :, $2)
fi
])




dnl Usage:
dnl  SIM_CHECK_X11MU([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to find the X11 miscellaneous utilities extension. If it is
dnl  found, this shell variable is set:
dnl
dnl    $sim_ac_x11mu_libs   (link libraries the linker needs for X11 MU)
dnl
dnl  The LIBS flag will also be modified accordingly. In addition, the
dnl  variable $sim_ac_x11mu_avail is set to "yes" if the X11 miscellaneous
dnl  utilities extension is found.
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl TODO:
dnl    * [mortene:20000122] make sure this work on MSWin (with
dnl      Cygwin installation)
dnl

AC_DEFUN(SIM_CHECK_X11MU,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

sim_ac_x11mu_avail=no
sim_ac_x11mu_libs="-lXmu"
sim_ac_save_libs=$LIBS
LIBS="$sim_ac_x11mu_libs $LIBS"

AC_CACHE_CHECK([whether the X11 miscellaneous utilities is available],
  sim_cv_lib_x11mu_avail,
  [AC_TRY_LINK([#include <X11/Xlib.h>
                #include <X11/Xmu/Xmu.h>
                #include <X11/Xmu/StdCmap.h>],
               [(void)XmuAllStandardColormaps(0L);],
               sim_cv_lib_x11mu_avail=yes,
               sim_cv_lib_x11mu_avail=no)])

if test x"$sim_cv_lib_x11mu_avail" = xyes; then
  sim_ac_x11mu_avail=yes
  ifelse($1, , :, $1)
else
  LIBS=$sim_ac_save_libs
  ifelse($2, , :, $2)
fi
])



dnl Usage:
dnl  SIM_CHECK_X11XID([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to find the X11 extension device library. Sets this
dnl  shell variable:
dnl
dnl    $sim_ac_x11xid_libs   (link libraries the linker needs for X11 XID)
dnl
dnl  The LIBS flag will also be modified accordingly. In addition, the
dnl  variable $sim_ac_x11xid_avail is set to "yes" if the X11 extension
dnl  device library is found.
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl TODO:
dnl    * [mortene:20000122] make sure this work on MSWin (with
dnl      Cygwin installation)
dnl

AC_DEFUN(SIM_CHECK_X11XID,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

sim_ac_x11xid_avail=no
sim_ac_x11xid_libs="-lXi"
sim_ac_save_libs=$LIBS
LIBS="$sim_ac_x11xid_libs $LIBS"

AC_CACHE_CHECK([whether the X11 extension device library is available],
  sim_cv_lib_x11xid_avail,
  [AC_TRY_LINK([#include <X11/extensions/XInput.h>],
               [(void)XOpenDevice(0L, 0);],
               sim_cv_lib_x11xid_avail=yes,
               sim_cv_lib_x11xid_avail=no)])

if test x"$sim_cv_lib_x11xid_avail" = xyes; then
  sim_ac_x11xid_avail=yes
  ifelse($1, , :, $1)
else
  LIBS=$sim_ac_save_libs
  ifelse($2, , :, $2)
fi
])



dnl ************************************************************************

dnl Usage:
dnl  SIM_CHECK_MOTIF([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to compile and link against the Motif library. Sets these
dnl  shell variables:
dnl
dnl    $sim_ac_motif_cppflags (extra flags the compiler needs for Motif)
dnl    $sim_ac_motif_ldflags  (extra flags the linker needs for Motif)
dnl    $sim_ac_motif_libs     (link libraries the linker needs for Motif)
dnl
dnl  The CPPFLAGS, LDFLAGS and LIBS flags will also be modified accordingly.
dnl  In addition, the variable $sim_ac_motif_avail is set to "yes" if
dnl  the Motif library development installation is ok.
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl

AC_DEFUN(SIM_CHECK_MOTIF,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

AC_ARG_WITH(motif, AC_HELP_STRING([--with-motif=DIR], [use the Motif library [default=yes]]), , [with_motif=yes])

sim_ac_motif_avail=no

if test x"$with_motif" != xno; then
  if test x"$with_motif" != xyes; then
    sim_ac_motif_cppflags="-I${with_motif}/include"
    sim_ac_motif_ldflags="-L${with_motif}/lib"
  fi

  sim_ac_motif_libs="-lXm"

  sim_ac_save_cppflags=$CPPFLAGS
  sim_ac_save_ldflags=$LDFLAGS
  sim_ac_save_libs=$LIBS

  CPPFLAGS="$sim_ac_motif_cppflags $CPPFLAGS"
  LDFLAGS="$sim_ac_motif_ldflags $LDFLAGS"
  LIBS="$sim_ac_motif_libs $LIBS"

  AC_CACHE_CHECK([for Motif development kit],
    sim_cv_lib_motif_avail,
    [AC_TRY_LINK([#include <Xm/Xm.h>],
                 [XmUpdateDisplay(0L);],
                 sim_cv_lib_motif_avail=yes,
                 sim_cv_lib_motif_avail=no)])

  if test x"$sim_cv_lib_motif_avail" = xyes; then
    sim_ac_motif_avail=yes
    ifelse($1, , :, $1)
  else
    CPPFLAGS=$sim_ac_save_cppflags
    LDFLAGS=$sim_ac_save_ldflags
    LIBS=$sim_ac_save_libs
    ifelse($2, , :, $2)
  fi
fi
])


dnl ************************************************************************

dnl Usage:
dnl  SIM_CHECK_XMEDRAWSHADOWS([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to compile and link code with the XmeDrawShadows() function
dnl  from Motif 2.0 (which is used by the InventorXt library). Sets the
dnl  variable $sim_ac_xmedrawshadows_avail to either "yes" or "no".
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl

AC_DEFUN(SIM_CHECK_XMEDRAWSHADOWS,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

sim_ac_xmedrawshadows_avail=no

AC_CACHE_CHECK([for XmeDrawShadows() function in Motif library],
  sim_cv_lib_xmedrawshadows_avail,
  [AC_TRY_LINK([#include <Xm/Xm.h>],
               [XmeDrawShadows(0L, 0L, 0L, 0L, 0, 0, 0, 0, 0, 0);],
               sim_cv_lib_xmedrawshadows_avail=yes,
               sim_cv_lib_xmedrawshadows_avail=no)])

if test x"$sim_cv_lib_xmedrawshadows_avail" = xyes; then
  sim_ac_xmedrawshadows_avail=yes
  ifelse($1, , :, $1)
else
  ifelse($2, , :, $2)
fi
])

dnl Usage:
dnl  SIM_CHECK_OPENGL([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to find an OpenGL development system, either a native
dnl  implementation or the OpenGL-compatible Mesa libraries. If
dnl  it is found, these shell variables are set:
dnl
dnl    $sim_ac_gl_cppflags (extra flags the compiler needs for OpenGL/Mesa)
dnl    $sim_ac_gl_ldflags  (extra flags the linker needs for OpenGL/Mesa)
dnl    $sim_ac_gl_libs     (link libraries the linker needs for OpenGL/Mesa)
dnl
dnl  The CPPFLAGS, LDFLAGS and LIBS flags will also be modified accordingly.
dnl  In addition, the variable $sim_ac_gl_avail is set to "yes" if an
dnl  OpenGL-compatible development system is found. If the OpenGL system
dnl  found is the Mesa libraries, we will also set $sim_ac_gl_is_mesa to
dnl  "yes".
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl TODO:
dnl    * [mortene:20000122] make sure this work on MSWin (with
dnl      Cygwin installation)
dnl

AC_DEFUN(SIM_CHECK_OPENGL,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

AC_ARG_WITH(opengl, AC_HELP_STRING([--with-opengl=DIR], [OpenGL/Mesa installation directory]), , [with_opengl=yes])

sim_ac_gl_avail=no
sim_ac_gl_is_mesa=no

if test x"$with_opengl" != xno; then
  if test x"$with_opengl" != xyes; then
    sim_ac_gl_cppflags="-I${with_opengl}/include"
    sim_ac_gl_ldflags="-L${with_opengl}/lib"
  fi

  sim_ac_save_cppflags=$CPPFLAGS
  sim_ac_save_ldflags=$LDFLAGS

  CPPFLAGS="$CPPFLAGS $sim_ac_gl_cppflags"
  LDFLAGS="$LDFLAGS $sim_ac_gl_ldflags"

  sim_ac_save_libs=$LIBS
  sim_ac_gl_libs="-lMesaGLU -lMesaGL"
  LIBS="$sim_ac_gl_libs $LIBS"

  AC_CACHE_CHECK([whether OpenGL libraries with the Mesa prefix are available],
    sim_cv_lib_mesa_avail,
    [AC_TRY_LINK([#include <GL/gl.h>
                  #include <GL/glu.h>],
                 [glPointSize(1.0f); gluSphere(0L, 1.0, 1, 1);],
                 sim_cv_lib_mesa_avail=yes,
                 sim_cv_lib_mesa_avail=no)])

  if test x"$sim_cv_lib_mesa_avail" = xyes; then
    sim_ac_gl_is_mesa=yes
    sim_ac_gl_avail=yes
  else
    sim_ac_gl_libs="-lGLU -lGL"
    LIBS="$sim_ac_gl_libs $sim_ac_save_libs"

    AC_CACHE_CHECK([whether OpenGL libraries are available],
      sim_cv_lib_gl_avail,
      [AC_TRY_LINK([#include <GL/gl.h>
                    #include <GL/glu.h>],
                   [glPointSize(1.0f); gluSphere(0L, 1.0, 1, 1);],
                   sim_cv_lib_gl_avail=yes,
                   sim_cv_lib_gl_avail=no)])

    if test x"$sim_cv_lib_gl_avail" = xyes; then
      sim_ac_gl_avail=yes
      AC_CACHE_CHECK([whether OpenGL libraries actually are the Mesa libraries],
        sim_cv_lib_gl_ismesa,
        [AC_TRY_LINK([#include <GL/gl.h>
                      #include <GL/glu.h>],
                     [#ifndef MESA
                      #error not mesa
                      #endif],
                     sim_cv_lib_gl_ismesa=yes,
                     sim_cv_lib_gl_ismesa=no)])
      if test x"$sim_cv_lib_gl_ismesa" = xyes; then
        sim_ac_gl_is_mesa=yes
      fi
    fi
  fi

  if test x"$sim_ac_gl_avail" = xyes; then
    ifelse($1, , :, $1)
  else
    CPPFLAGS=$sim_ac_save_cppflags
    LDFLAGS=$sim_ac_save_ldflags
    LIBS=$sim_ac_save_libs
    ifelse($2, , :, $2)
  fi
fi
])

dnl Usage:
dnl  SIM_CHECK_INVENTOR([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to find the Open Inventor development system. If it is found, these
dnl  shell variables are set:
dnl
dnl    $sim_ac_oiv_cppflags (extra flags the compiler needs for Inventor)
dnl    $sim_ac_oiv_ldflags  (extra flags the linker needs for Inventor)
dnl    $sim_ac_oiv_libs     (link libraries the linker needs for Inventor)
dnl
dnl  The CPPFLAGS, LDFLAGS and LIBS flags will also be modified accordingly.
dnl  In addition, the variable $sim_ac_oiv_avail is set to "yes" if
dnl  the Open Inventor development system is found.
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl

AC_DEFUN(SIM_CHECK_INVENTOR,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

AC_ARG_WITH(inventor, AC_HELP_STRING([--with-inventor=DIR], [use the Open Inventor library [default=no]]), , [with_inventor=yes])

sim_ac_oiv_avail=no

if test x"$with_inventor" != xno; then
  if test x"$with_inventor" != xyes; then
    sim_ac_oiv_cppflags="-I${with_inventor}/include"
    sim_ac_oiv_ldflags="-L${with_inventor}/lib"
  else
    AC_MSG_CHECKING(value of the OIVHOME environment variable)
    if test x"$OIVHOME" = x; then
      AC_MSG_RESULT(empty)
      AC_MSG_WARN(OIVHOME environment variable not set -- this might be an indication of a problem)
    else
      AC_MSG_RESULT($OIVHOME)
      sim_ac_oiv_cppflags="-I$OIVHOME/include"
      sim_ac_oiv_ldflags="-L$OIVHOME/lib"
    fi
  fi

  sim_ac_oiv_libs="-lInventor -limage"

  sim_ac_save_cppflags=$CPPFLAGS
  sim_ac_save_ldflags=$LDFLAGS
  sim_ac_save_libs=$LIBS

  CPPFLAGS="$sim_ac_oiv_cppflags $CPPFLAGS"
  LDFLAGS="$sim_ac_oiv_ldflags $LDFLAGS"
  LIBS="$sim_ac_oiv_libs $LIBS"

  AC_CACHE_CHECK([for Open Inventor developer kit],
    sim_cv_lib_oiv_avail,
    [AC_TRY_LINK([#include <Inventor/SoDB.h>],
                 [SoDB::init();],
                 sim_cv_lib_oiv_avail=yes,
                 sim_cv_lib_oiv_avail=no)])

  if test x"$sim_cv_lib_oiv_avail" = xyes; then
    sim_ac_oiv_avail=yes
    ifelse($1, , :, $1)
  else
    CPPFLAGS=$sim_ac_save_cppflags
    LDFLAGS=$sim_ac_save_ldflags
    LIBS=$sim_ac_save_libs
    ifelse($2, , :, $2)
  fi
fi
])



dnl ************************************************************************

dnl Usage:
dnl  SIM_CHECK_OIV_XT([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to compile and link against the Xt GUI glue library for
dnl  the Open Inventor development system. Sets this shell
dnl  variable:
dnl
dnl    $sim_ac_oivxt_libs     (link libraries the linker needs for InventorXt)
dnl
dnl  The LIBS variable will also be modified accordingly. In addition,
dnl  the variable $sim_ac_oivxt_avail is set to "yes" if the Xt glue
dnl  library for the Open Inventor development system is found.
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl

AC_DEFUN(SIM_CHECK_OIV_XT,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

sim_ac_oivxt_avail=no

sim_ac_oivxt_libs="-lInventorXt"
sim_ac_save_libs=$LIBS
LIBS="$sim_ac_oivxt_libs $LIBS"

AC_CACHE_CHECK([for Xt glue library in the Open Inventor developer kit],
  sim_cv_lib_oivxt_avail,
  [AC_TRY_LINK([#include <Inventor/Xt/SoXt.h>],
               [(void)SoXt::init(0L, 0L);],
               sim_cv_lib_oivxt_avail=yes,
               sim_cv_lib_oivxt_avail=no)])

if test x"$sim_cv_lib_oivxt_avail" = xyes; then
  sim_ac_oivxt_avail=yes
  ifelse($1, , :, $1)
else
  LIBS=$sim_ac_save_libs
  ifelse($2, , :, $2)
fi
])

dnl Usage:
dnl  SIM_CHECK_COIN([ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]])
dnl
dnl  Try to find the Coin library development system. If it is found,
dnl  these shell variables are set:
dnl
dnl    $sim_ac_coin_cppflags (extra flags the compiler needs for Coin)
dnl    $sim_ac_coin_ldflags  (extra flags the linker needs for Coin)
dnl    $sim_ac_coin_libs     (link libraries the linker needs for Coin)
dnl
dnl  The CPPFLAGS, LDFLAGS and LIBS flags will also be modified accordingly.
dnl  In addition, the variable $sim_ac_coin_avail is set to "yes"
dnl  if the Coin development system is found.
dnl
dnl
dnl Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl TODO:
dnl    * [mortene:20000123] make sure this work on MSWin (with Cygwin
dnl      installation)
dnl

AC_DEFUN(SIM_CHECK_COIN,[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.14.1])

AC_ARG_WITH(coin, AC_HELP_STRING([--with-coin=DIR], [set the prefix directory where Coin resides]), , [with_coin=yes])

sim_ac_coin_avail=no

if test x"$with_coin" != xno; then
  sim_ac_path=$PATH
  if test x"$with_coin" != xyes; then
    sim_ac_path=${with_coin}/bin:$PATH
  fi

  AC_PATH_PROG(sim_ac_conf_cmd, coin-config, true, $sim_ac_path)

  sim_ac_coin_cppflags=`$sim_ac_conf_cmd --cppflags`
  sim_ac_coin_ldflags=`$sim_ac_conf_cmd --ldflags`
  sim_ac_coin_libs=`$sim_ac_conf_cmd --libs`

  sim_ac_save_cppflags=$CPPFLAGS
  sim_ac_save_ldflags=$LDFLAGS
  sim_ac_save_libs=$LIBS

  CPPFLAGS="$CPPFLAGS $sim_ac_coin_cppflags"
  LDFLAGS="$LDFLAGS $sim_ac_coin_ldflags"
  LIBS="$sim_ac_coin_libs $LIBS"

  AC_CACHE_CHECK([whether the Coin library is available],
    sim_cv_lib_coin_avail,
    [AC_TRY_LINK([#include <Inventor/SoDB.h>],
                 [SoDB::init();],
                 sim_cv_lib_coin_avail=yes,
                 sim_cv_lib_coin_avail=no)])

  if test x"$sim_cv_lib_coin_avail" = xyes; then
    sim_ac_coin_avail=yes
    ifelse($1, , :, $1)
  else
    CPPFLAGS=$sim_ac_save_cppflags
    LDFLAGS=$sim_ac_save_ldflags
    LIBS=$sim_ac_save_libs
    ifelse($2, , :, $2)
  fi
fi
])

# Configure paths for GTK+
# Owen Taylor     97-11-3

dnl AM_PATH_GTK([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND [, MODULES]]]])
dnl Test for GTK, and define GTK_CFLAGS and GTK_LIBS
dnl
AC_DEFUN(AM_PATH_GTK,
[dnl 
dnl Get the cflags and libraries from the gtk-config script
dnl
AC_ARG_WITH(gtk-prefix,[  --with-gtk-prefix=PFX   Prefix where GTK is installed (optional)],
            gtk_config_prefix="$withval", gtk_config_prefix="")
AC_ARG_WITH(gtk-exec-prefix,[  --with-gtk-exec-prefix=PFX Exec prefix where GTK is installed (optional)],
            gtk_config_exec_prefix="$withval", gtk_config_exec_prefix="")
AC_ARG_ENABLE(gtktest, [  --disable-gtktest       Do not try to compile and run a test GTK program],
		    , enable_gtktest=yes)

  for module in . $4
  do
      case "$module" in
         gthread) 
             gtk_config_args="$gtk_config_args gthread"
         ;;
      esac
  done

  if test x$gtk_config_exec_prefix != x ; then
     gtk_config_args="$gtk_config_args --exec-prefix=$gtk_config_exec_prefix"
     if test x${GTK_CONFIG+set} != xset ; then
        GTK_CONFIG=$gtk_config_exec_prefix/bin/gtk-config
     fi
  fi
  if test x$gtk_config_prefix != x ; then
     gtk_config_args="$gtk_config_args --prefix=$gtk_config_prefix"
     if test x${GTK_CONFIG+set} != xset ; then
        GTK_CONFIG=$gtk_config_prefix/bin/gtk-config
     fi
  fi

  AC_PATH_PROG(GTK_CONFIG, gtk-config, no)
  min_gtk_version=ifelse([$1], ,0.99.7,$1)
  AC_MSG_CHECKING(for GTK - version >= $min_gtk_version)
  no_gtk=""
  if test "$GTK_CONFIG" = "no" ; then
    no_gtk=yes
  else
    GTK_CFLAGS=`$GTK_CONFIG $gtk_config_args --cflags`
    GTK_LIBS=`$GTK_CONFIG $gtk_config_args --libs`
    gtk_config_major_version=`$GTK_CONFIG $gtk_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
    gtk_config_minor_version=`$GTK_CONFIG $gtk_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
    gtk_config_micro_version=`$GTK_CONFIG $gtk_config_args --version | \
           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
    if test "x$enable_gtktest" = "xyes" ; then
      ac_save_CFLAGS="$CFLAGS"
      ac_save_LIBS="$LIBS"
      CFLAGS="$CFLAGS $GTK_CFLAGS"
      LIBS="$GTK_LIBS $LIBS"
dnl
dnl Now check if the installed GTK is sufficiently new. (Also sanity
dnl checks the results of gtk-config to some extent
dnl
      rm -f conf.gtktest
      AC_TRY_RUN([
#include <gtk/gtk.h>
#include <stdio.h>
#include <stdlib.h>

int 
main ()
{
  int major, minor, micro;
  char *tmp_version;

  system ("touch conf.gtktest");

  /* HP/UX 9 (%@#!) writes to sscanf strings */
  tmp_version = g_strdup("$min_gtk_version");
  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
     printf("%s, bad version string\n", "$min_gtk_version");
     exit(1);
   }

  if ((gtk_major_version != $gtk_config_major_version) ||
      (gtk_minor_version != $gtk_config_minor_version) ||
      (gtk_micro_version != $gtk_config_micro_version))
    {
      printf("\n*** 'gtk-config --version' returned %d.%d.%d, but GTK+ (%d.%d.%d)\n", 
             $gtk_config_major_version, $gtk_config_minor_version, $gtk_config_micro_version,
             gtk_major_version, gtk_minor_version, gtk_micro_version);
      printf ("*** was found! If gtk-config was correct, then it is best\n");
      printf ("*** to remove the old version of GTK+. You may also be able to fix the error\n");
      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
      printf("*** required on your system.\n");
      printf("*** If gtk-config was wrong, set the environment variable GTK_CONFIG\n");
      printf("*** to point to the correct copy of gtk-config, and remove the file config.cache\n");
      printf("*** before re-running configure\n");
    } 
#if defined (GTK_MAJOR_VERSION) && defined (GTK_MINOR_VERSION) && defined (GTK_MICRO_VERSION)
  else if ((gtk_major_version != GTK_MAJOR_VERSION) ||
	   (gtk_minor_version != GTK_MINOR_VERSION) ||
           (gtk_micro_version != GTK_MICRO_VERSION))
    {
      printf("*** GTK+ header files (version %d.%d.%d) do not match\n",
	     GTK_MAJOR_VERSION, GTK_MINOR_VERSION, GTK_MICRO_VERSION);
      printf("*** library (version %d.%d.%d)\n",
	     gtk_major_version, gtk_minor_version, gtk_micro_version);
    }
#endif /* defined (GTK_MAJOR_VERSION) ... */
  else
    {
      if ((gtk_major_version > major) ||
        ((gtk_major_version == major) && (gtk_minor_version > minor)) ||
        ((gtk_major_version == major) && (gtk_minor_version == minor) && (gtk_micro_version >= micro)))
      {
        return 0;
       }
     else
      {
        printf("\n*** An old version of GTK+ (%d.%d.%d) was found.\n",
               gtk_major_version, gtk_minor_version, gtk_micro_version);
        printf("*** You need a version of GTK+ newer than %d.%d.%d. The latest version of\n",
	       major, minor, micro);
        printf("*** GTK+ is always available from ftp://ftp.gtk.org.\n");
        printf("***\n");
        printf("*** If you have already installed a sufficiently new version, this error\n");
        printf("*** probably means that the wrong copy of the gtk-config shell script is\n");
        printf("*** being found. The easiest way to fix this is to remove the old version\n");
        printf("*** of GTK+, but you can also set the GTK_CONFIG environment to point to the\n");
        printf("*** correct copy of gtk-config. (In this case, you will have to\n");
        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
        printf("*** so that the correct libraries are found at run-time))\n");
      }
    }
  return 1;
}
],, no_gtk=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
       CFLAGS="$ac_save_CFLAGS"
       LIBS="$ac_save_LIBS"
     fi
  fi
  if test "x$no_gtk" = x ; then
     AC_MSG_RESULT(yes)
     ifelse([$2], , :, [$2])     
  else
     AC_MSG_RESULT(no)
     if test "$GTK_CONFIG" = "no" ; then
       echo "*** The gtk-config script installed by GTK could not be found"
       echo "*** If GTK was installed in PREFIX, make sure PREFIX/bin is in"
       echo "*** your path, or set the GTK_CONFIG environment variable to the"
       echo "*** full path to gtk-config."
     else
       if test -f conf.gtktest ; then
        :
       else
          echo "*** Could not run GTK test program, checking why..."
          CFLAGS="$CFLAGS $GTK_CFLAGS"
          LIBS="$LIBS $GTK_LIBS"
          AC_TRY_LINK([
#include <gtk/gtk.h>
#include <stdio.h>
],      [ return ((gtk_major_version) || (gtk_minor_version) || (gtk_micro_version)); ],
        [ echo "*** The test program compiled, but did not run. This usually means"
          echo "*** that the run-time linker is not finding GTK or finding the wrong"
          echo "*** version of GTK. If it is not finding GTK, you'll need to set your"
          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
          echo "*** is required on your system"
	  echo "***"
          echo "*** If you have an old version installed, it is best to remove it, although"
          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"
          echo "***"
          echo "*** If you have a RedHat 5.0 system, you should remove the GTK package that"
          echo "*** came with the system with the command"
          echo "***"
          echo "***    rpm --erase --nodeps gtk gtk-devel" ],
        [ echo "*** The test program failed to compile or link. See the file config.log for the"
          echo "*** exact error that occured. This usually means GTK was incorrectly installed"
          echo "*** or that you have moved GTK since it was installed. In the latter case, you"
          echo "*** may want to edit the gtk-config script: $GTK_CONFIG" ])
          CFLAGS="$ac_save_CFLAGS"
          LIBS="$ac_save_LIBS"
       fi
     fi
     GTK_CFLAGS=""
     GTK_LIBS=""
     ifelse([$3], , :, [$3])
  fi
  AC_SUBST(GTK_CFLAGS)
  AC_SUBST(GTK_LIBS)
  rm -f conf.gtktest
])

# configure paths for GtkGLArea
#�Janne L�f 1999-17-2


# AM_PATH_GTKGL([ACTION-IF-FOUND [,ACTION-IF-NOT-FOUND]])
AC_DEFUN(AM_PATH_GTKGL,
[
AC_REQUIRE([AM_PATH_GTK])
AC_PROVIDE([AM_PATH_GTKGL])

AC_ARG_WITH(gl-prefix,    [  --with-gl-prefix=PFX   Prefix where OpenGL or Mesa is installed],
 gl_prefix="$withval",
 gl_prefix="")

AC_ARG_WITH(gtkgl-prefix, [  --with-gtkgl-prefix=PFX Prefix where GtkGLArea is installed],
 gtkgl_prefix="$withval",
 gtkgl_prefix="")



if test x$gl_prefix != x ; then
 GL_CFLAGS="-I$gl_prefix/include"
 GL_LDOPTS="-L$gl_prefix/lib"
else
 GL_CFLAGS=""
 GL_LDOPTS=""
fi

saved_LIBS="$LIBS"
saved_CFLAGS="$CFLAGS"

# test for plain OpenGL
AC_MSG_CHECKING([GL])
LIBS="$saved_LIBS $GTK_LIBS $GL_LDOPTS -lGLU -lGL"
AC_TRY_LINK([#include <GL/gl.h>], [glBegin(GL_POLYGON);], have_GL=yes, have_GL=no)
AC_MSG_RESULT($have_GL)

if test x$have_GL = xyes; then

 GL_LIBS="-lGLU -lGL"

else

 # test for Mesa
 AC_MSG_CHECKING([Mesa])
 LIBS="$saved_LIBS $GTK_LIBS $GL_LDOPTS -lMesaGLU -lMesaGL"
 AC_TRY_LINK( [char glBegin();] ,[glBegin(GL_POLYGON);], have_Mesa=yes, have_Mesa=no)
 AC_MSG_RESULT($have_Mesa)

 if test x$have_Mesa = xyes; then

  GL_LIBS="-lMesaGLU -lMesaGL"

 else

  # test for Mesa with threads
  AC_MSG_CHECKING([Mesa with pthreads])
  LIBS="$saved_LIBS $GTK_LIBS $GL_LDOPTS -lMesaGLU -lMesaGL -lpthread"
  AC_TRY_LINK([#include <GL/gl.h>], [glBegin(GL_POLYGON);], have_Mesa_pthread=yes, have_Mesa_pthread=no)
  AC_MSG_RESULT($have_Mesa_pthread)

  if test x$have_Mesa_pthread = xyes; then
    
    GL_LIBS="-lMesaGLU -lMesaGL -lpthread"

  else

   #all failed
   LIBS="$saved_LIBS"
   CFLAGS="$saved_CFLAGS"
   GTKGL_LIBS=""
   GTKGL_CFLAGS=""
   ifelse([$2], , :, [$2])

  fi
 fi
fi


if test x$gtkgl_prefix != x; then
 GTKGL_CFLAGS="-I$gtkgl_prefix/include"
 GTKGL_LDOPTS="-L$gtkgl_prefix/lib"
else
 GTKGL_CFLAGS=""
 GTKGL_LDOPTS=""
fi

AC_MSG_CHECKING([GtkGLArea])
LIBS="$save_LIBS -lgtkgl $GTK_LIBS $GL_LDOPTS $GL_LIBS $GTKGL_LDOPTS"
AC_TRY_LINK([#include <gtkgl/gtkglarea.h>], [gtk_gl_area_new(0L);], have_gtkgl=yes, have_gtkgl=no)
AC_MSG_RESULT($have_gtkgl)

if test x$have_gtkgl = xyes; then

 LIBS="$saved_LIBS"
 CFLAGS="$saved_CFLAGS"
 GTKGL_CFLAGS="$GTKGL_CFLAGS $GL_CFLAGS"
 GTKGL_LIBS="$GTKGL_LDOPTS -lgtkgl $GL_LDOPTS $GL_LIBS"
 ifelse([$1], , :, [$1])

else

 LIBS="$saved_LIBS"
 CFLAGS="$saved_CFLAGS"
 GTKGL_LIBS=""
 GTKGL_CFLAGS=""
 ifelse([$2], , :, [$2])

fi

AC_SUBST(GTKGL_CFLAGS)
AC_SUBST(GTKGL_LIBS)

])


dnl  Let the user decide if compilation should be done in "debug mode".
dnl  If compilation is not done in debug mode, all assert()'s in the code
dnl  will be disabled.
dnl
dnl  Also sets enable_debug variable to either "yes" or "no", so the
dnl  configure.in writer can add package-specific actions. Default is "yes".
dnl
dnl  Note: this macro must be placed after either AC_PROG_CC or AC_PROG_CXX
dnl  in the configure.in script.
dnl
dnl  Author: Morten Eriksen, <mortene@sim.no>.
dnl

AC_DEFUN(SIM_COMPILE_DEBUG,
[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.13])
AC_ARG_ENABLE(debug,
  [  --enable-debug          compile in debug mode [default=yes]],
  [case "${enableval}" in
    yes) enable_debug=yes ;;
    no)  enable_debug=no ;;
    *) AC_MSG_ERROR(bad value \"${enableval}\" for --enable-debug) ;;
  esac],
  enable_debug=yes)

if test "x$enable_debug" = "xno"; then
  CFLAGS="$CFLAGS -DNDEBUG"
  CXXFLAGS="$CXXFLAGS -DNDEBUG"
fi
])

dnl  Let the user decide if debug symbol information should be compiled
dnl  in. The compiled libraries/executables will use a lot less space
dnl  if stripped for their symbol information.
dnl
dnl  Note: this macro must be placed after either AC_PROG_CC or AC_PROG_CXX
dnl  in the configure.in script.
dnl
dnl  Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl  TODO:
dnl    * [mortene:19991114] make this work with compilers other than gcc/g++
dnl

AC_DEFUN(SIM_DEBUGSYMBOLS,
[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.13])
AC_ARG_ENABLE(symbols,
  [  --enable-symbols        (GCC only) include symbol debug information
                          [default=yes]],
  [case "${enableval}" in
    yes) enable_symbols=yes ;;
    no)  enable_symbols=no ;;
    *) AC_MSG_ERROR(bad value \"${enableval}\" for --enable-symbols) ;;
  esac],
  enable_symbols=yes)

if test "x$enable_symbols" = "xno"; then
  if test "x$GXX" = "xyes" || "x$GCC" = "xyes"; then
    CFLAGS="`echo $CFLAGS | sed 's/-g//'`"
    CXXFLAGS="`echo $CXXFLAGS | sed 's/-g//'`"
  else
    AC_MSG_WARN(--disable-symbols only has effect when using GNU gcc or g++)
  fi
fi
])

dnl  Let the user decide if RTTI should be compiled in. The compiled
dnl  libraries/executables will use a lot less space if they don't
dnl  contain RTTI.
dnl
dnl  Note: this macro must be placed after AC_PROG_CXX in the
dnl  configure.in script.
dnl
dnl  Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl  TODO:
dnl    * [mortene:19991114] make this work with compilers other than gcc/g++
dnl

AC_DEFUN(SIM_RTTI_SUPPORT,
[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.13])
AC_ARG_ENABLE(rtti,
  [  --enable-rtti           (g++ only) compile with RTTI [default=no]],
  [case "${enableval}" in
    yes) enable_rtti=yes ;;
    no)  enable_rtti=no ;;
    *) AC_MSG_ERROR(bad value \"${enableval}\" for --enable-rtti) ;;
  esac],
  enable_rtti=no)

if test "x$enable_rtti" = "xno"; then
  if test "x$GXX" = "xyes"; then
    CXXFLAGS="$CXXFLAGS -fno-rtti"
  fi
else
  if test "x$GXX" != "xyes"; then
    AC_MSG_WARN(--enable-rtti only has effect when using GNU g++)
  fi
fi
])

dnl  Let the user decide if C++ exception handling should be compiled
dnl  in. The compiled libraries/executables will use a lot less space
dnl  if they have exception handling support.
dnl
dnl  Note: this macro must be placed after AC_PROG_CXX in the
dnl  configure.in script.
dnl
dnl  Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl  TODO:
dnl    * [mortene:19991114] make this work with compilers other than gcc/g++
dnl

AC_DEFUN(SIM_EXCEPTION_HANDLING,
[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.13])
AC_ARG_ENABLE(exceptions,
  [  --enable-exceptions     (g++ only) compile with exceptions [default=no]],
  [case "${enableval}" in
    yes) enable_exceptions=yes ;;
    no)  enable_exceptions=no ;;
    *) AC_MSG_ERROR(bad value \"${enableval}\" for --enable-exceptions) ;;
  esac],
  enable_exceptions=no)

if test "x$enable_exceptions" = "xno"; then
  if test "x$GXX" = "xyes"; then
    unset _exception_flag
    dnl This is for GCC >= 2.8
    SIM_COMPILER_OPTION(-fno-exceptions, _exception_flag=-fno-exceptions)
    if test "x$_exception_flag" = "x"; then
      dnl For GCC versions < 2.8
      SIM_COMPILER_OPTION(-fno-handle-exceptions, _exception_flag=-fno-handle-exceptions)
    fi
    if test "x$_exception_flag" = "x"; then
      AC_MSG_WARN(couldn't find a valid option for avoiding exception handling)
    else
      CXXFLAGS="$CXXFLAGS $_exception_flag"
    fi
  fi
else
  if test "x$GXX" != "xyes"; then
    AC_MSG_WARN(--enable-exceptions only has effect when using GNU g++)
  fi
fi
])

dnl  Use this file to store miscellaneous macros related to checking
dnl  compiler features.
dnl
dnl  Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl  TODO:
dnl
dnl    * [mortene:19991125] make SIM_COMPILER_OPTION work with C compilers.
dnl
dnl    * [mortene:19991218] improve SIM_COMPILER_OPTION by catching
dnl      and analyzing stderr (at least to see if there was any output
dnl      there.)
dnl


dnl SIM_COMPILER_OPTION(OPTION-TO-TEST, ACTION-IF-TRUE [, ACTION-IF-FALSE])
AC_DEFUN(SIM_COMPILER_OPTION,
[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.13])
AC_MSG_CHECKING(whether $CXX accepts [$1])
_save_cxxflags=$CXXFLAGS
CXXFLAGS="$CXXFLAGS [$1]"
AC_TRY_COMPILE( , , _accept_result=yes [$2], _accept_result=no [$3])
AC_MSG_RESULT($_accept_result)
CXXFLAGS=$_save_cxxflags
unset _accept_result _save_cxxflags
])

dnl  Let the user decide if profiling code should be compiled
dnl  in. The compiled libraries/executables will use a lot less space
dnl  if they don't contain profiling code information, and they will also
dnl  execute faster.
dnl
dnl  Note: this macro must be placed after either AC_PROG_CC or AC_PROG_CXX
dnl  in the configure.in script.
dnl
dnl  Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl  TODO:
dnl    * [mortene:19991114] make this work with compilers other than gcc/g++
dnl

AC_DEFUN(SIM_PROFILING_SUPPORT,
[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.13])
AC_ARG_ENABLE(profile,
  [  --enable-profile        (GCC only) turn on inclusion of profiling code
                          [default=no]],
  [case "${enableval}" in
    yes) enable_profile=yes ;;
    no)  enable_profile=no ;;
    *) AC_MSG_ERROR(bad value \"${enableval}\" for --enable-profile) ;;
  esac],
  enable_profile=no)

if test "x$enable_profile" = "xyes"; then
  if test "x$GXX" = "xyes" || test "x$GCC" = "xyes"; then
    CFLAGS="$CFLAGS -pg"
    CXXFLAGS="$CXXFLAGS -pg"
    LDFLAGS="$LDFLAGS -pg"
  else
    AC_MSG_WARN(--enable-profile only has effect when using GNU gcc or g++)
  fi
fi
])

dnl  Let the user decide if compilation should be done with all compiler
dnl  warnings turned on.
dnl
dnl  Note: this macro must be placed after either AC_PROG_CC or AC_PROG_CXX
dnl  in the configure.in script.
dnl
dnl  Author: Morten Eriksen, <mortene@sim.no>.
dnl
dnl  TODO:
dnl    * [mortene:19991114] make this work with compilers other than gcc/g++
dnl    * [mortene:19991114] find out how to get GCC's
dnl      -Werror-implicit-function-declaration option to work as expected
dnl    * [larsa:19991126] use -Wno-multichar under BeOS only (BeOS system
dnl      header files emit lots of warnings due to multichar definitions)
dnl


dnl SIM_COMPILER_WARNINGS( )
AC_DEFUN(SIM_COMPILER_WARNINGS,
[
dnl Autoconf is a developer tool, so don't bother to support older versions.
AC_PREREQ([2.13])
AC_ARG_ENABLE(warnings,
  [  --enable-warnings       (GCC only) turn on warnings when compiling
                          [default=yes]],
  [case "${enableval}" in
    yes) enable_warnings=yes ;;
    no)  enable_warnings=no ;;
    *) AC_MSG_ERROR(bad value \"${enableval}\" for --enable-warnings) ;;
  esac],
  enable_warnings=yes)

if test x"$enable_warnings" = xyes; then
  if test x"$GXX" = xyes || test x"$GCC" = xyes; then
    SIM_COMPILER_OPTION(-Wno-multichar, _warn_flags=-Wno-multichar)
    _warn_flags="-W -Wall -Wno-unused $_warn_flags"

    CFLAGS="$CFLAGS $_warn_flags"
    CXXFLAGS="$CXXFLAGS $_warn_flags"
  else
    case $host in
    *-*-irix*) 
      if test x"$CC" = xcc || test x"$CXX" = xCC; then
        _warn_flags=
        # Turn on all warnings.
        SIM_COMPILER_OPTION(-fullwarn, _warn_flags="$_warn_flags -fullwarn")
        # Turn off warnings on unused variables.
        SIM_COMPILER_OPTION(-woff 3262, _warn_flags="$_warn_flags -woff 3262")

        CFLAGS="$CFLAGS $_warn_flags"
        CXXFLAGS="$CXXFLAGS $_warn_flags"
      fi
    ;;
    esac
  fi
else
  if test x"$GXX" != xyes && test x"$GCC" != xyes; then
    AC_MSG_WARN(--enable-warnings only has effect when using GNU gcc or g++)
  fi
fi
])

