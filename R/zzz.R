.onLoad <- function(libname, pkgname) {
  if(!lcbc_font_installed())
    warning("You might want to run 'lcbc_install_font()' to install the LCBC branded font on your system.")
}
