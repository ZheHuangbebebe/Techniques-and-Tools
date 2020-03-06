function makeTeamList(teamData, namesData, teamsData) {
    var team = teamData.team;
    var teamPlayer = teamData.players;
    var name = namesData;
    var teams = teamsData;
    var result = [];
    var matches = [];
    var id = [];
    var player;
    for(var i = 0; i < teams.length; i++){
      if(teams[i].id == team.id){
        result.push("".concat(teams[i].team, ", coached by ", team.coach));
        break;
      }
    }
    for(var i = 0; i < teamPlayer.length; i++){
      matches.push(teamPlayer[i].matches);
    }
    matches = matches.sort((a, b) => b - a)
    for(var i = 0; i < matches.length; i++){
      for(var j = 0; j < teamPlayer.length; j++){
        if(matches[i] == teamPlayer[j].matches){
          id.push(teamPlayer[j].id);
        }
      }
    }
    for(var i = 0; i < id.length; i++){
      for(var j = 0; j < name.length; j++){
        if(id[i] == name[j].id){
          result.push("".concat(i+1, ". ", name[j].name));
        }
      }
    }
    return result;
}

const teamJson = process.argv[2];
const namesJson = process.argv[3];
const teamsJson = process.argv[4];
if (teamJson === undefined || namesJson === undefined || teamsJson === undefined) {
  throw new Error(`input not supplied`);
}

// some sample data
const team  = require(`./${teamJson}`);
const names  = require(`./${namesJson}`);
const teams  = require(`./${teamsJson}`);
console.log(makeTeamList(team, names.names, teams.teams));
