
#' Run bing search
#' 
#' @param term the search keyword
#' @param page the page number of the bing search result.
#' 
#' @return a list of search results in current search page, each result
#'      page link item in the result list may contains fields:
#' 
#'   + url: the result page url
#'   + title: the title of the target page
#' 
const search as function(term, page = 1) {
    const cvid as string = toupper(md5(runif()));
}