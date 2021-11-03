require(MicrosoftBing);

print(MicrosoftBing::search("apple wikipedia", .cache = `${@dir}/.cache/`));