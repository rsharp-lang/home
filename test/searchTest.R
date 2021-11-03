require(MicrosoftBing);

options(debug = TRUE);

print(MicrosoftBing::search("apple wikipedia", .cache = `${@dir}/.cache/`));