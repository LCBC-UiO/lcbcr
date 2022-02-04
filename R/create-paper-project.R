#' Initiate a paper project
#'
#' @param dir directory to create the project in
#' @param title Title of the project
#' @param edit Should files to edit be opened.
#'
#' @return no return
#' @export
create_paper_project <- function(dir,
                                 title,
                                 edit = interactive()){
  type <- "create-paper-project"
  pkgname <- basename(dir)
  title <- tools::toTitleCase(title)
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  template_dir <- system.file(file.path("rstudio", "templates","project", type),
                              package = "lcbcr")
  dirs <- list.dirs(template_dir, full.names = FALSE)
  k <- lapply(dirs, function(x) dir.create(file.path(dir, x), recursive = TRUE, showWarnings = FALSE))
  files <- list.files(template_dir, recursive = TRUE)
  k <- lapply(files, function(x){
    file.copy(file.path(template_dir, x),
              file.path(dir, x))
  })
  files <- list.files(dir, full.names = TRUE, recursive = TRUE)
  k <- lapply(files, template_replace, pkgname = pkgname, title = title)
}

new_project_create_paper_project <- function(dir, ...) {
  params <- list(...)
  create_paper_project(dir, params$title, edit = FALSE)
}

template_replace <- function(file, pkgname, title) {
  input <- readLines(file)
  output <- gsub("\\{REPO\\}", pkgname, input)
  output <- gsub("\\{TITLE\\}", title, output)
  writeLines(output, file)
}
