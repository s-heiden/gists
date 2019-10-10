const replace = require("replace-in-file");
const fs = require("fs");
const os = require("os");

(() => {
  /*
   * declare variables
   */
  let filePath = process.argv[2];
  let settingsPath = null;
  let options = null;

  /*
   * handle command line args
   */
  if (process.argv.length < 3 || process.argv.length > 4) {
    console.log("usage: `node index.js filePath [settingsPath]`");
  }

  if (process.argv.length === 3) {
    settingsPath = os.homedir() + "/.config/.regex-replacer.json";
  }

  if (process.argv.length === 4) {
    settingsPath = process.argv[3];
  }

  /*
   * read settings json
   */
  fs.readFile(settingsPath, "utf8", (err, jsonString) => {
    if (err) {
      console.log("Error reading file from disk:", err);
      return;
    }
    try {
      options = JSON.parse(jsonString);

      // convert parsed strings into json objects
      options.from = options.from.map(from => new RegExp(from, "g"));

      options.files = filePath;
      console.log(options);

      /*
       * perform replacement
       */
      try {
        replace.sync(options);
      } catch (error) {
        console.error("Error occurred:", error);
      }
    } catch (err) {
      console.log("Error parsing JSON string:", err);
    }
  });
})();
