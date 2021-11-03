

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
const search as function(term, page = 1, .cache = "./.cache/") {
    const url as string  = .bingUrl(term, page);
    const html as string = REnv::getHtml(url);
    const query = system.file("graphquery/bing_en.graphquery", package = "") 
    |> readText()
    |> graphquery::parseQuery()
    ;
}

const .bingUrl as function(term, page) {
    const cvid as string = toupper(md5(runif()));
    const hash as string = mid(toupper(md5(runif())), 1, 6);
    const urlcomponent as string = list(
        q        = term,
        qs       = "HS",
        sc       = "8-5",
        cvid     = cvid,
        FORM     = hash,
        sp       = 1,
        ensearch = 1,
        first    = page * 10
    ) |> urlencode();

    `https://cn.bing.com/search?${urlcomponent}`;
}