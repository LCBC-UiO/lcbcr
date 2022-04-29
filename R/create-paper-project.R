#' Initiate a paper project
#'
#' @param dir directory to create the project in
#' @param title Title of the project
#' @param use_git initiate git or not (default TRUE)
#' @param use_renv initiate renv or not (default FALSE)
#' @param edit Should files to edit be opened.
#'
#' @return no return
#' @export
create_paper_project <- function(dir,
                                 title,
                                 use_git = TRUE,
                                 use_renv = FALSE,
                                 edit = interactive()){
  type <- "create-paper-project"
  pkgname <- basename(dir)
  title <- tools::toTitleCase(title)
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  template_dir <- system.file(file.path("rstudio", "templates","project", type),
                              package = "lcbcr")
  dirs <- list.dirs(template_dir, full.names = FALSE)
  dirs <- unique(c("data", "docs", "figures", "results", "scripts", dirs))
  k <- lapply(dirs, function(x)
    dir.create(file.path(dir, x),
               recursive = TRUE,
               showWarnings = FALSE)
  )
  files <- list.files(template_dir, recursive = TRUE)
  k <- lapply(files, function(x){
    file.copy(file.path(template_dir, x),
              file.path(dir, x))
  })
  files <- list.files(dir, full.names = TRUE, recursive = TRUE)
  k <- lapply(files, template_replace, pkgname = pkgname, title = title)
  if(use_git){
    lines <- c(
      "# Remove lines as needed to easily add data again.",
      "# If you only want to add a single file within an",
      "# ignored folder, you can force add that specific",
      "# file, and still ignore the remaining folder content",
      "# by default.",
      "",
      "# ignore folder with potential data",
      "data/",
      "results/",
      "",
      "# ignore common non-text files that can inflate repo size",
      "figures/*png",
      "figures/*pdf",
      "figures/*tiff",
      "figures/*jpg",
      "figures/*jpeg",
      "docs/*pdf",
      "docs/*.doc",
      "docs/*.docx",
      "",
      "# ignore R stuff",
      ".Rhistory",
      ".Rproj.user/",
      "",
      "# ignore mac hidden file",
      "**.DS_Store",
      ""
    )
    writeLines(lines, sprintf("%s/.gitignore", dir))
    gert::git_init()
  }
  if(use_renv)
    renv::init(project = dir)
}

new_project_create_paper_project <- function(dir, ...) {
  params <- list(...)
  create_paper_project(dir,
                       title = params$title,
                       use_git = params$use_git,
                       use_renv = params$use_renv,
                       edit = FALSE)
}

template_replace <- function(file, pkgname, title) {
  input <- readLines(file)
  output <- gsub("\\{REPO\\}", pkgname, input)
  output <- gsub("\\{TITLE\\}", title, output)
  writeLines(output, file)
}
