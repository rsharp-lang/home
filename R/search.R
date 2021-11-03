imports ["graphquery", "Html"] from "webKit";

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
    options(http.cache_dir = .cache); 

    const url as string = .bingUrl(term, page);
    const html  = REnv::getHtml(url) |> Html::parse();
    const query = system.file("graphquery/bing_en.graphquery", package = "MicrosoftBing") 
    |> readText()
    |> graphquery::parseQuery()
    ;
    const output = html 
    |> graphquery::query(
        graphquery = query
    );

    list(
        bing_url  = url,
        page_num  = page,
        term      = urlencode(term),
        b_results = output
    );
}

const .bingUrl as function(term, page) {
    const cvid as string = toupper(md5(term));
    const hash as string = mid(toupper(md5(`${term}+${page}`)), 1, 6);
    const urlcomponent as string = list(
        q        = term,        
        ensearch = 0,
        first    = 1 + (page - 1) * 10
    ) |> urlencode()
    ;

    if (getOption("debug", default = FALSE)) {
        print(`Search Bing: https://cn.bing.com/search?${urlcomponent}`);
    }

    `https://cn.bing.com/search?${urlcomponent}`;
}