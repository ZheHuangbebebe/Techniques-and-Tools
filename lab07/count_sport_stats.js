function countStats(data) {
    var matchesSum = 0;
    var triesSum = 0;
    var i;
    for (i = 0; i < data.length; i++){
        matchesSum = matchesSum + parseInt(data[i].matches);
        triesSum = triesSum + parseInt(data[i].tries);
    }
    var obj = { matches : matchesSum, tries : triesSum}
    return obj;
}

const json = process.argv[2];
if (json === undefined) {
    throw new Error(`input not supplied`);
}
// include the json file via node's module system,
// this parses the json file into a JS object
// NOTE: this only works via node and will not work in the browser
const stats = require(`./${json}`);

console.log(countStats(stats.results));
