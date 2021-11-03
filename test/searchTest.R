require(MicrosoftBing);

options(debug = TRUE);

str(MicrosoftBing::search("apple wikipedia", .cache = `${@dir}/.cache/`));