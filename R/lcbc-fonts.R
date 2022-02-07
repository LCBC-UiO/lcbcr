
#' Install Avenir font for LCBC branding
#'
#' @params ... arguments to \code{\link[extrafont]{font_import}}
#'
#' @export
#' @examples
#' lcbc_install_font()
#' @importFrom extrafont loadfonts font_import
lcbc_install_font <- function(...){
  font_dir <- system.file("avenir-font/", package = "lcbcr")
  font_files <- list.files(font_dir, "ttf$", full.names = TRUE)

  switch(Sys.info()[1],
         "Linux" = {
           if(!dir.exists('~/.fonts')) dir.create('~/.fonts')
           k <- sapply(font_files, file.copy,  "~/.fonts")
           system('fc-cache -f ~/.fonts')
         },
         "Darwin" = {
           k <- sapply(font_files, file.copy,  "~/Library/Fonts")
         },
         "Windows" = {
           extrafont::loadfonts(device = "win", quiet = TRUE)
         }
  )

  extrafont::font_import(pattern = "Avenir", ...)
}

lcbc_font_installed <- function(){
  all(c("Avenir Book", "Avenir Light", "Avenir") %in% extrafont::fonts())
}
