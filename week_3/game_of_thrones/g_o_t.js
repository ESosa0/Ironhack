var fs = require('fs');
function fileActions(err, file){ 
  if (err) {
      throw err;
  }
  var episodes = JSON.parse(file);

  function findJonSnow(){
    for(var i=0; i<episodes.length; i++){
      var string = episodes[i].description
        substring = "Jon Snow";
      if (string.indexOf(substring) >-1){
        return ("Found Jon Snow in episode " + episodes[i].episode_number);
      } 
    }
  }

  function highlyRated(value){
    return value.rating >= 8.5;
  }

  var highestRated = episodes.filter(highlyRated);

  var sortedEpisodes = highestRated.sort(function(ep1,ep2) {
    var keyA = (ep1.episode_number),
        keyB = (ep2.episode_number);
        return keyA-keyB;
  });

  for(var i=0; i<sortedEpisodes.length; i++){
    console.log(sortedEpisodes[i].title + "  Episode # " + sortedEpisodes[i].episode_number)
    console.log(sortedEpisodes[i].description)
    var stars = sortedEpisodes[i].rating;
    console.log("Rating " + stars + " " + "*".repeat(stars) + "\n");
  }

  console.log(findJonSnow())

}

fs.readFile("./GoTEpisodes.json", 'utf8', fileActions);

