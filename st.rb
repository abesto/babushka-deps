# https://wiki.archlinux.org/index.php/St
# st is a simple terminal.

dep 'st' do
  requires 'st-git.aur', 'tmux.bin', 'adobe-source-code-pro-fonts.lib'
end

dep 'st-git.aur' do
  pkgbuild_patch = %q(--- a/PKGBUILD	2016-10-30 15:33:41.733648053 +0100
+++ b/PKGBUILD	2016-10-30 15:33:52.643648053 +0100
@@ -15,8 +15,8 @@
 makedepends=('ncurses' 'libxext' 'git')
 epoch=1
 # include config.h and any patches you want to have applied here
-source=('git://git.suckless.org/st')
-sha1sums=('SKIP')
+source=('git://git.suckless.org/st' 'config.h')
+sha1sums=('SKIP' 'SKIP')
 
 provides=("${_pkgname}")
 conflicts=("${_pkgname}")
)

  config_h_patch = %q(--- config.def.h	2016-10-30 15:48:25.323648054 +0100
+++ config.h	2016-10-30 15:50:53.140314719 +0100
@@ -5,7 +5,7 @@
  *
  * font: see http://freedesktop.org/software/fontconfig/fontconfig-user.html
  */
-static char font[] = "Fixed:pixelsize=13:style=SemiCondensed";
+static char font[] = "Source Code Pro:style=Semibold:size=12";
 static int borderpx = 2;
 
 /*
@@ -82,44 +82,42 @@
  */
 static unsigned int tabspaces = 8;
 
-/* Terminal colors (16 first used in escape sequence) */
+/* Suckless ST config.h Fragment
+ * Generated with Hodler (http://github.com/matttproud/hodler)
+ * From fisherman metro theme (https://github.com/fisherman/metro/blob/master/Metro.itermcolors)
+ */
 static const char *colorname[] = {
-	/* 8 normal colors */
-	"black",
-	"red3",
-	"green3",
-	"yellow3",
-	"blue2",
-	"magenta3",
-	"cyan3",
-	"gray90",
-
-	/* 8 bright colors */
-	"gray50",
-	"red",
-	"green",
-	"yellow",
-	"#5c5cff",
-	"magenta",
-	"cyan",
-	"white",
-
+	"#000000",		/* 0: ANSI Color 0 */
+	"#cc0000",		/* 1: ANSI Color 1 */
+	"#00ff00",		/* 2: ANSI Color 2 */
+	"#ffcc00",		/* 3: ANSI Color 3 */
+	"#666666",		/* 4: ANSI Color 4 */
+	"#ffffff",		/* 5: ANSI Color 5 */
+	"#ffffff",		/* 6: ANSI Color 6 */
+	"#ffffff",		/* 7: ANSI Color 7 */
+	"#333333",		/* 8: ANSI Color 8 */
+	"#333333",		/* 9: ANSI Color 9 */
+	"#00ff00",		/* 10: ANSI Color 10 */
+	"#ffcc00",		/* 11: ANSI Color 11 */
+	"#666666",		/* 12: ANSI Color 12 */
+	"#ffffff",		/* 13: ANSI Color 13 */
+	"#ffffff",		/* 14: ANSI Color 14 */
+	"#ffffff",		/* 15: ANSI Color 15 */
 	[255] = 0,
-
-	/* more colors can be added after 255 to use with DefaultXX */
-	"#cccccc",
-	"#555555",
+	[256] = "#000000",		/* 256: Background */
+	[257] = "#e6e6e6",		/* 257: Foreground */
+	[258] = "#808080",		/* 258: Cursor */
+	[259] = "#000000",		/* 259: Cursor Text */
+	/* No support for text highlight coloring; would be #000000. */
+	/* No support for highlight coloring; would be #ffffff. */
+	/* No support for bold coloring; would be #ffffff. */
 };
 
+static unsigned int defaultfg  = 257;
+static unsigned int defaultbg  = 256;
+static unsigned int defaultcs  = 258;
+static unsigned int defaultrcs = 259;
 
-/*
- * Default colors (colorname index)
- * foreground, background, cursor, reverse cursor
- */
-static unsigned int defaultfg = 7;
-static unsigned int defaultbg = 0;
-static unsigned int defaultcs = 1;
-static unsigned int defaultrcs = 257;
 
 /*
  * Default shape of cursor
)

  pkgbuild_patch_file = nil
  config_h_patch_file = nil

  pre_build {
    require 'tempfile'
    pkgbuild_patch_file = Tempfile.new
    pkgbuild_patch_file.write pkgbuild_patch
    pkgbuild_patch_file.close

    config_h_patch_file = Tempfile.new
    config_h_patch_file.write config_h_patch
    config_h_patch_file.close

    "cp st-git/src/st/config.def.h ./st-git/config.h && patch -i #{pkgbuild_patch_file.path} st-git/PKGBUILD && patch -i #{config_h_patch_file.path} ./st-git/config.h"
  }

  post_build {
    "rm #{pkgbuild_patch_file.path} #{config_h_patch_file.path}"
  }
end

dep 'tmux.bin'
