var fs = require('fs');
function fileActions(err, file){ 
  if (err) {
      throw err;
  }
  var episodes = JSON.parse(file);

  var sortedEpisodes = episodes.sort(function(ep1,ep2) {
    var keyA = (ep1.episode_number),
        keyB = (ep2.episode_number);
        return keyA-keyB;
  });

console.log(sortedEpisodes.title)

  for(var i=0; i<sortedEpisodes.length; i++){
    console.log(sortedEpisodes[i].title + "  Episode # " + sortedEpisodes[i].episode_number)
    console.log(sortedEpisodes[i].description)
    var stars = sortedEpisodes[i].rating;
    console.log("Rating " + stars + " " + "*".repeat(stars) + "\n");
  }
}
fs.readFile("./GoTEpisodes.json", 'utf8', fileActions);