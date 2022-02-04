#' @importFrom extrafont loadfonts font_import
.onLoad <- function(libname, pkgname) {

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

  suppressWarnings(
    suppressMessages(
      extrafont::font_import(pattern = "Avenir", prompt = FALSE)
    )
  )
}
