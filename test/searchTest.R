require(MicrosoftBing);

options(debug = TRUE);
options(strict = FALSE);

result = MicrosoftBing::search("apple wikipedia", .cache = `${@dir}/.cache/`);

str(result);

cache = MicrosoftBing::getCachePage(result[[1]]);

print(cache);