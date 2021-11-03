require(MicrosoftBing);

options(debug = TRUE);
options(strict = FALSE);

result = MicrosoftBing::search("apple wikipedia", .cache = `${@dir}/.cache/`);

str(result);

cache = MicrosoftBing::getCachePage(result$b_results[[1]], .cache = `${@dir}/.cache/`);

print(cache);