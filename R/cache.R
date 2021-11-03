
#' Get bing cached page
#' 
#' @description get cached page from bing server.
#' @param link one result item from the bing search result list.
#' 
#' @return this function will returns the page 
#'    content html document text.
#' 
const getCachePage as function(link, .cache = "./cache") {
    const argv = list(
        d       = link$cache$date,
        mkt     = "en-US",
        setlang = "en-US",
        w       = link$cache$uid
    );
    const url as string = `http://cncc.bingj.com/cache.aspx?${urlencode(argv)}`;

    if (getOption("debug")) {
        print(`Bing Cache: ${url}`);
    }

    REnv::getHtml(url);
}