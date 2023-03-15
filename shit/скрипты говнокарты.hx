//If someone wants to use my code to create their own map, you can use it safely, I will only be glad if my code will help someone with the map.
var players = [null, null, null, null, null, null, null, null];
var orderedPlayers = [];
var units = [[],[],[],[],[],[],[],[],[]];
var mode;
var isMapModeSelected = false;
var botsList = [];
var teamsWithOnePlayer = [false,false,false,false];
var aiCount = 0;
var playersCount = 0;
var countTeamsWithOnePlayer = 0;
var snakeLorePicked;
var prestigeDrakkarCounter = [0,0,0,0,0,0,0,0];
var clanHappynes = [
	[0,0,0,0,0,0],//player1
	[0,0,0,0,0,0],//player2
	[0,0,0,0,0,0],//player3
	[0,0,0,0,0,0],//player4
	[0,0,0,0,0,0],//player5
	[0,0,0,0,0,0],//player6
	[0,0,0,0,0,0],//player7
	[0,0,0,0,0,0] //player8
];
var myrkCountInMainTile = [
	[0,0,0,0,0,0],//player1
	[0,0,0,0,0,0],//player2
	[0,0,0,0,0,0],//player3
	[0,0,0,0,0,0],//player4
	[0,0,0,0,0,0],//player5
	[0,0,0,0,0,0],//player6
	[0,0,0,0,0,0],//player7
	[0,0,0,0,0,0] //player8
];
var time = 0;
var fameState = [0,0,0,0,0,0,0,0];
var ticks = 0;
var resAmountBefore = [
	[0,0,0,0,0,0,0,0],//Fame
	[0,0,0,0,0,0,0,0],//Food
	[0,0,0,0,0,0,0,0],//Wood
	[0,0,0,0,0,0,0,0] //Money
];
//var fameAmountBefore = [0,0,0,0,0,0,0,0];
var snakeLorePicked = false;
var elfsKilled = false;
var jottansKilled = false;
var myrkTimer = 0;
var myrkFoodTimer = 0;
var avgMyrks = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
var happynesFromMyrks = [false,false,false,false,false,false,false,false];

var allPlayersRdy = false;
var playersRdy = 0;

var debugTime = false;
var cheatsOn = false;
var openAllMap = false; //if true, let some lags when you choice mode

var teamNumber = [2,3,4];
var clanOrder = [Clan.Wolf, Clan.Raven, Clan.Bear, Clan.Horse,  Clan.Ox, Clan.Kraken, Clan.Snake, Clan.Goat];
var totalPlayerNumber = clanOrder.length;
var drakkarSpeed = .10;
var drakkarSpawnX = 0;
var drakkarSpawnY = 0;
var maxDrakkarSize = 6;
var totalTeamNumber = 4;
var islandsNumber = 3;
var modeNames = ['2x2','2x2x2','2x2x2x2'];
var villagerFoodProd = 4;
var prestigeStages = [200,400,600,800];
var prestigeSupplys = [2,2,3,3];
var victoryPrestige = 1000;
var resKind = [Resource.Food,Resource.Wood,Resource.Lore,Resource.Iron,Resource.Stone];
var resourcesSupplys = [
	[50,75,100,125],//food
	[50,75,100,125],//wood
	[50,0 ,0  ,0  ],//lore
	[0 ,5 ,0  ,0  ],//iron
	[0 ,0 ,5  ,10 ]//stone
];
var prestigeNotifyText = [
	'You have gained 50 [Food], 50 [Wood] and 50 [Lore].',
	'You have gained 75 [Food], 75 [Wood] and 5 [Iron].',
	'You have gained 100 [Food], 100 [Wood] and 5 [Stone].',
	'You have gained 125 [Food], 125 [Wood] and 10 [Stone].'
];
var fameTilesNeeded = [6,5,8];
var fameAmountNeeded = [
	[700,800,900],
	[700,800,900],
	[700,900,1100,1300]
];
var eventsName = [Event.BloodMoon,Event.Rats,Event.Earthquake,Event.Blizzard,Event.DraugrAttack,Event.FallenSailors,Event.KrakenAttack,Event.FrozenSea,Event.Eruption];
var eventsTime = [62,2,2,122,2,2,122,122,242];
var scoutingTimers = [420,300,540,540];//[420,720,1260,1800];

//id tiles
var tilesMaxBuildings = [
	[for(i in [189,182,86]) getZone(i)], //2 Buildings
	[for(i in [49,29,60,52,84,54,55,89,108,115,172,144,151,206,230,233,201,173]) getZone(i)], //3 Buildings
	[for(i in [195,184,163,159,165,158,175,199,217,212,221,211,192,180]) getZone(i)], //4 Buildings
	[for(i in [37,57,42,61,80,66,73,98,100,92,183,153,140,143,193,223,241,240]) getZone(i)], //5 Buildings
	[for(i in [31,67,33,64,65,48,63,99,121,103]) getZone(i)], //6 Buildings
];
var fullMaps = [
	[for(i in [31,49,37,57,67,69,50,29,61,42,64,52,33]) getZone(i)],//island1
	[for(i in [84,65,54,48,55,63,89,99,108,121,115,103,80,66,73,98,100,92,86]) getZone(i)],//island2
	[for(i in [183,153,140,143,173,193,223,241,240,201,182,172,144,151,206,230,233,175,199,195,184,163,159,165,158,189,152,217,212,221,211,192,180]) getZone(i)]//island3
];
var mainTiles = [
	[for(i in [31,67,33,64]) getZone(i)],//island1
	[for(i in [65,99,121,48,63,103]) getZone(i)],//island2
	[for(i in [153,183,140,143,241,240,223,193]) getZone(i)]//island3
];
var firstTiles = [
	[for(i in [37,57,42,61]) getZone(i)],//island1
	[for(i in [80,98,100,66,73,92]) getZone(i)],//island2
	[for(i in [163,195,159,158,221,217,211,180]) getZone(i)]//island3
];
var seaTiles = [
	[for(i in [19,83,20,75]) getZone(i)],//island1
	[for(i in [60,109,139,27,62,116]) getZone(i)],//island2
	[for(i in [146,177,132,122,253,255,232,202]) getZone(i)],//island3
];
var scoutTiles = [
	[//island1
		firstTiles[0],//stage1
		mainTiles[0],//stage2
		[for(i in [52,49]) getZone(i)],//stage3
		[for(i in [69,50,29]) getZone(i)]//stage4
	],
	[//island2
		firstTiles[1],//stage1
		mainTiles[1],//stage2
		[for(i in [54,55,89,108,115,84]) getZone(i)],//stage3
		[getZone(86)]//stage4
	],
	[//island3
		firstTiles[2],//stage1
		mainTiles[2],//stage2
		[for(i in [144,184,201,189,212,182,165,173,192,230]) getZone(i)],//stage3
		[for(i in [172,151,233,206,175,199]) getZone(i)]//stage4
	]
];
//Technica tiles
var startedTiles = [for(i in [235,231,245,210,220,204,186,196]) getZone(i)];
var islandConnectors = [for(i in [81,93,114,126,130,118]) getZone(i)]; //we need connectors tiles coz fish cant spawn on islands if it havent connect, thats bug ¯\_(ツ)_/¯
var neitralSpawns = [
	[getZone(50)],//island1
	[getZone(86)],//island2
	[getZone(175),getZone(199)]//island3
];
var startRes = [
	[15,200,50,0],//Wolf
	[15,200,50,0],//Raven
	[15,200,50,0],//Bear
	[15,200,50,0],//Horse
	[15,240,150,0],//Ox
	[15,240,50,0],//Kraken
	[15,240,50,0],//Snake
	[15,220,50,0] //Goat
];
var eventTime = 480;

function init() {
	if (!isHost()) {
		return;
	}
	if (state.time == 0) {
		mapPlayers();
		copyStartedUnits();
		setMaxBuildings();
		createTeamsWithOnePlayerList();
		modeSelectInterface();
		scoutingSchedule();
		state.removeVictory(VictoryKind.VMoney);
		state.removeVictory(VictoryKind.VFame);
		noEvent();
	}
}

function regularUpdate(dt : Float) {
	if (!isHost()) {
		return;
	}
	if (!isMapModeSelected) {
		killAllUnits(startedTiles);
		if (!allPlayersRdy && playersCount-1 == playersRdy) {
			allPlayersRdy = true;
			for (i in 0...modeNames.length) {
				me().objectives.setVisible('selectMode'+i, countTeamsWithOnePlayer <= teamNumber[i]);
			}
			me().objectives.setVisible('pressReadyWait', false);
		}
	}
	if (isMapModeSelected) {
		@split[
			checkPrestige(),
			checkFame(),
			checkHappynes(),
			snakeStolenLoreCheck(),
			checkRelic(),
			checkNeitralFractions(),
			produceExtraFoodFromMyrks(),
			eventTimer()
		];
	}
}

function invokeHostPlayerRdy(player:Player) {
	@sync {
		player.objectives.setVisible('readyButton', false);
		player.objectives.setVisible('selectModeWaiting', true);
		playersRdy++;
	}
}

function produceExtraFoodFromMyrks() {
	@sync {
		if (!elfsKilled && myrkFoodTimer == 240) {
			if (debugTime) debug(''+avgMyrks);
			for (cl in 0...myrkCountInMainTile.length) {
				var tempMyrkAmount = 0;
				for (ct in 0...myrkCountInMainTile[cl].length) {
					tempMyrkAmount += myrkCountInMainTile[cl][ct];
				}
				if (tempMyrkAmount <= 0) {
					avgMyrks[cl] = 0;
				}
				else {
					avgMyrks[cl]=tempMyrkAmount/myrkFoodTimer;
					var myrkFood:Dynamic = toInt(avgMyrks[cl]*0.2*120);
					(orderedPlayers[cl]:Player).addResource(Resource.Food,myrkFood,false);
					var c:Dynamic = orderedPlayers[cl];
					invoke(c, 'invokeMyrksNotifyFood',[myrkFood]);
				}
			}
			myrkFoodTimer = 0;
		}
		else if (!elfsKilled) {
			for (i in 0...orderedPlayers.length) {
				var tempMyrkAmount = 0;
				for (zone in orderedPlayers[i].zones) {
					for (u in zone.units) {
						if (u.kind == Unit.Myrkalfar && u.owner == orderedPlayers[i]) {
							tempMyrkAmount++;
						}
					}
				}
				myrkCountInMainTile[i][myrkFoodTimer] = tempMyrkAmount;
			}
			myrkFoodTimer++;
		}
		else return;
	}
}

function invokeMyrksNotifyFood(food) {
	sfx(UiSfx.NewFameTitle, 0.5);
	me().genericNotify('Your [Myrkalfar]s produce extra '+food+' [Food] for your clan!');
}

function checkNeitralFractions() {
	@sync {
		for (i in 0...orderedPlayers.length) {
			var fameRes = (orderedPlayers[i]:Player).getResource(Resource.Fame);
			//var foodRes = (orderedPlayers[i]:Player).getResource(Resource.Food);
			var woodRes = (orderedPlayers[i]:Player).getResource(Resource.Wood);
			var moneyRes = (orderedPlayers[i]:Player).getResource(Resource.Money);
			var c:Dynamic = orderedPlayers[i];
			if (!jottansKilled && fameRes - resAmountBefore[0][i] >= 150) { //thats needed to find who kill jottans, we cant ask game who kill them
				jottansKilled = true;
				orderedPlayers[i].addResource(Resource.Money, 100);
				orderedPlayers[i].addResource(Resource.Stone, 15);
				orderedPlayers[i].addResource(Resource.Wood, 100);
				invoke(c, 'invokeResFromJottans',[]);
			}
			else if (!elfsKilled && fameRes - resAmountBefore[0][i] >= 50 && woodRes - resAmountBefore[2][i] >= 90 && moneyRes - resAmountBefore[3][i] >= 90 ) {
				elfsKilled = true;
				orderedPlayers[i].addResource(Resource.Stone, 15);
				invoke(c, 'invokeResFromElfs',[]);
			}
			else {
				resAmountBefore[0][i]=toInt(fameRes);
				//resAmountBefore[1][i]=toInt(foodRes);
				resAmountBefore[2][i]=toInt(woodRes);
				resAmountBefore[3][i]=toInt(moneyRes);
			}
			if (orderedPlayers[i].getAlignment(getFaction("Myrkalfar")) >= 10 && myrkTimer >= 1440) {
				myrkTimer = 0;
				var myrkAmount = 0;
				if (debugTime) debug(''+orderedPlayers[i].getAlignment(getFaction("Myrkalfar")));
				for (u in orderedPlayers[i].units) {
					if (u.kind == Unit.Myrkalfar) {
						myrkAmount++;
					}
				}
				if (myrkAmount < 4) {
					var myrkForSpawn:Dynamic = 4 - myrkAmount;
					invoke(c, 'invokeMyrksNotify',[myrkForSpawn]);
					mainTiles[mode][i].addUnit(Unit.Myrkalfar,myrkForSpawn,orderedPlayers[i]);
					for (u in mainTiles[mode][i].units) {
						if (u.kind == Unit.Myrkalfar && u.owner == null) {
							u.setControlable(true);
							u.owner = orderedPlayers[i];
						}
					}
				}
				if (!happynesFromMyrks[i]) {
					happynesFromMyrks[i] == true;
					orderedPlayers[i].addResource(Resource.Happy,2,false);
				}
			}
			else myrkTimer++;
		}
	}
}

function invokeMyrksNotify(myrkForSpawn) {
	sfx(UiSfx.NewFameTitle, 0.5);
	me().genericNotify('Mykalfars are helping to you and send '+myrkForSpawn+' [Myrkalfar]. All time when they on your tiles, they produce food!');
}

//function getGiantFaction() : Faction { return getFaction("Giant");  }
//function getKoboldFaction() : Faction { return getFaction("Kobold");  }
//function getMyrkalfarFaction() : Faction { return getFaction("Myrkalfar");  }

function copyStartedUnits() {
	for (i in 0...startedTiles.length) {
		units[i] = startedTiles[i].units.copy();
		startedTiles[i].maxBuildings = 0;
	}
}

function moveCameraToMain(mainHall) {
    setCamera(mainHall);
}

function invokeCameraMoving() {
    for (player in state.players) {
        var d:Dynamic = player.getTownHall();
        invoke(player, 'moveCameraToMain', [d]);
    }
}

function setMaxBuildings() {
	@sync {
		for (i in 0...tilesMaxBuildings.length) {
			for (tile in tilesMaxBuildings[i]) {
				tile.maxBuildings = i+2;
			}
		}
	}
}

function checkFame() {
	@sync {
		for (i in 0...players.length) {
			var fameRes = (players[i]:Player).getResource(Resource.Fame);
			for (b in 0...fameAmountNeeded[mode].length) {
				if (fameRes>=fameAmountNeeded[mode][b] && b == fameState[i]) {
					fameState[i]++;
					for (p in players) {
						var c:Dynamic = players[i];
						invoke(p, 'invokeFameNotifys', [c,fameAmountNeeded[mode][b],mode]);
					}
				}
				if (fameTilesNeeded[mode]<=players[i].zones.length && fameAmountNeeded[mode][b] <= fameRes && b == fameState[i]) {
					if (players[i].hasBuilding(Building.Temple)) {
						players[i].customVictory('You wining by Fame!', ''+players[i].name+' wining by Fame!');
					}
				}
			}
		}
	}
}

function checkRelic() {
	var money:Dynamic = 0;
	@sync {
		if (ticks == 120) {
			for (player in 0...orderedPlayers.length) {
				if ((orderedPlayers[player]:Player).hasBuilding(Building.RelicCup,false,false)) {
					ticks = 0;
					var prestigeKoef = 0.044;
					var prestige = orderedPlayers[player].getResource(Resource.Prestige);
					money = (0.6 + ( prestige / 60 ) * prestigeKoef)*60;
					orderedPlayers[player].addResource(Resource.Money,money,false);
					invoke(orderedPlayers[player], 'invokeNotifysMoney', [money]);
				}
			}
		}
		else ticks++;
	}
}

function eventTimer() {
	if (state.time >= eventTime) {
		var rnd = toInt(random(9));
		eventTime += 360 + eventsTime[rnd];
		state.events.setEvent(eventsName[rnd], 6);
	}
}

function checkHappynes() {
	var foodCoef1 = 0.8;
	var foodCoef2 = 0.1;
	@sync {
		for (player in 0...players.length) {
			clanHappynes[player][time] = toInt((players[player]:Player).currentHappiness);
		}
		time++;
		if (time==240) {
			var avgHappynes = [0,0,0,0,0,0,0,0];
			for (cl in 0...clanHappynes.length) {
				var tempHappynes = 0;
				for (hp in 0...clanHappynes[cl].length) {
					tempHappynes += clanHappynes[cl][hp];
				}
				if (tempHappynes <= 0) {
					avgHappynes[cl] = 0;
				}
				else avgHappynes[cl]=toInt(tempHappynes/time);
			}
			for (i in 0...players.length) {
				var population = players[i].getResource(Resource.Population);
				if (population >= 12 && avgHappynes[i] >= 3) {
					var gift = toInt(population * villagerFoodProd * foodCoef1 + population * villagerFoodProd * avgHappynes[i] * foodCoef2);
					players[i].addResource(Resource.Food,gift,false);
					var k:Dynamic = players[i];
					invoke(k, 'invokeHappyNotifys', [(gift:Dynamic)]);
				}
			}
			time = 0;
			if (debugTime) debug('avg'+avgHappynes);
		}
	}
}

function cheats() {
	if (cheatsOn) {
		me().addResource(Resource.Food,3000,false);
		me().addResource(Resource.Wood,3000,false);
		me().addResource(Resource.Money,3000,false);
		me().addResource(Resource.Lore,3000,false);
		me().addResource(Resource.Stone,300,false);
		me().addResource(Resource.Iron,300,false);
		me().addResource(Resource.Happy,300,false);
		//me().addResource(Resource.Fame,1000,false);
	}
	if (openAllMap) me().discoverAll();
}

function scoutingSchedule() {
	@async {
		for (i in 0...scoutingTimers.length) {
			wait(scoutingTimers[i]);
			for (player in players) {
				for (tile in scoutTiles[mode][i]) {
					(player:Player).discoverZone((tile:Zone));
				}
			}
		}
	}
}

function disableModeButton() {
	for (i in 0...modeNames.length) {
		me().objectives.setVisible('selectMode'+i, false);
	}
	for (player in state.players) {
		player.objectives.setVisible('selectModeWaiting', false);
	}
}

function addBotsToOP() {
	var wt = countTeamsWithOnePlayer;
	while (wt < teamNumber[mode]) {
		var rnd = randomInt(toInt(botsList.length/2));
		orderedPlayers.push(botsList[rnd*2]);
		orderedPlayers.push(botsList[rnd*2+1]);

		botsList.remove(botsList[rnd*2+1]);
		botsList.remove(botsList[rnd*2]);
		wt++;
	}
}

function shufflePlayers() {
	for (i in 0...teamNumber[mode]) {
        for (j in 0...teamNumber[mode]) {
            var rnd = randomInt(2);
            if (rnd == 0) {
				var tempOrderedPlayer1=orderedPlayers[i*2];
				orderedPlayers[i*2]=orderedPlayers[j*2];
				orderedPlayers[j*2]=tempOrderedPlayer1;

				var tempOrderedPlayer2=orderedPlayers[i*2+1];
				orderedPlayers[i*2+1]=orderedPlayers[j*2+1];
				orderedPlayers[j*2+1]=tempOrderedPlayer2;
			}
        }
    }
}

function createOPAndBotsLists() {
	for (i in 0...totalTeamNumber) {
		if (!(players[i*2]:Player).isAI || !(players[i*2+1]:Player).isAI) {
			orderedPlayers.push((players[i*2]:Player));
			orderedPlayers.push((players[i*2+1]:Player));
		}
		else {
			botsList.push((players[i*2]:Player));
			botsList.push((players[i*2+1]:Player));
		}
	}
}

function getNewTownHalls() {
	@sync {
		for (i in 0...orderedPlayers.length) {
			mainTiles[mode][i].owner = orderedPlayers[i];
			orderedPlayers[i].discoverZone(mainTiles[mode][i]);
			orderedPlayers[i].discoverZone(firstTiles[mode][i]);
		}
		for (tile in startedTiles) {
			tile.takeControl(null,false);
		}
	}
}

function drakkarSpawn() {
	@sync {
		for (c in 0...orderedPlayers.length) {
			for (b in 0...totalPlayerNumber) {
				if (players[b] == orderedPlayers[c]) {
					var left = 0;
					var unitNumber = units[b].length;
					while (unitNumber > left) {
						var right = min(left + maxDrakkarSize, unitNumber);
						drakkar(orderedPlayers[c], mainTiles[mode][c], seaTiles[mode][c], drakkarSpawnX, drakkarSpawnY, [for(i in left...right) (units[b][i]:Unit).kind], drakkarSpeed);
						left += maxDrakkarSize;
					}
				}
			}
		}
	}
}

function blockToScout() {
	for (i in 0...islandsNumber) {
		if (i!=mode) {
			for (tile in fullMaps[i]) {
				tile.allowScouting = false;
			}
		}
	}
	for (tile in startedTiles) {
		tile.allowScouting = false;
	}
	for (tile in islandConnectors) {
		tile.allowScouting = false;
	}
}

function destroyOxAltars() {
	@sync {
		for (tile in mainTiles[mode]) {
			if (tile.owner.clan != Clan.Ox) {
				for (build in tile.buildings) {
					if (build.kind == Building.OxThrone) {
						build.remove();
					}
				}
			}
		}
	}
}

function setStandardRes() {
	@sync {
		for (player in 0...players.length) {
			players[player].setResource(Resource.Food,startRes[player][0]);
			players[player].setResource(Resource.Wood,startRes[player][1]);
			players[player].setResource(Resource.Money,startRes[player][2]);
			players[player].setResource(Resource.Lore,startRes[player][3]);
		}
	}
}

function selectMode() {
	isMapModeSelected = true;
	if (debugTime) debug('Start fnc selectMode'+mode);
	disableModeButton();
	if (debugTime) debug('Step1 compl buttons disabled');
	blockToScout();
	if (debugTime) debug('Step2 compl tiles blocked');
	createOPAndBotsLists();
	if (debugTime) debug('Step3 compl bots:'+[for(i in botsList) i.clan]);
	addBotsToOP();
	if (debugTime) debug('Step4 compl op:'+[for(i in orderedPlayers) i.clan]);
	shufflePlayers();
	if (debugTime) debug('Step5 compl op shuffled:'+[for(i in orderedPlayers) i.clan]);
	killNeitrals();
	if (debugTime) debug('Step6 compl op shuffled:'+[for(i in orderedPlayers) i.clan]);
	getNewTownHalls();
	if (debugTime) debug('Step7 compl');
	drakkarSpawn();
	if (debugTime) debug('Step8 compl');
	invokeCameraMoving();
	if (debugTime) debug('Step9 compl');
	destroyOxAltars();
	if (debugTime) debug('Step9 compl');
	coverZones();
	if (debugTime) debug('Step10 compl');
	setStandardRes();
	if (debugTime) debug('Step11 compl');
	cheats();
	if (debugTime) debug('Step12 compl');
	setModDescription();
	if (debugTime) debug('End fnc selectMode'+mode);
}

function coverZones() {
	@sync {
		for (tile in startedTiles) {
			for (player in players) {
				(player:Player).coverZone(tile);
			}
		}
	}
}

function killNeitrals() {
	@sync {
		var snakePlayer = players[6];
		for (i in 0...neitralSpawns.length) {
			if (i != mode) {
				for (t in neitralSpawns[i]) {
					killAllUnits([t]);
					t.takeControl(snakePlayer);
					t.takeControl(null);
					snakePlayer.coverZone(t);
				}
			}
		}
		for (i in 0...fullMaps.length) {
			if (i != mode) {
				for (t in fullMaps[i]) {
					killAllUnits([t]);
				}
			}
		}
	}
}

function selectMode0() {
	mode = 0;
	selectMode();
}
function selectMode1() {
	mode = 1;
	selectMode();
}
function selectMode2() {
	mode = 2;
	selectMode();
}

function modeSelectInterface() {
	for (pl in teamsWithOnePlayer) {
		if (pl) countTeamsWithOnePlayer++;
	}
	for (i in 0...modeNames.length) {
		me().objectives.add('selectMode'+i, '', {visible:false}, {name:modeNames[i], action:'selectMode'+i});
	}
	me().objectives.add('pressReadyWait', 'Wait until all players press ready.', {visible:true});
	for (player in state.players) {
		player.objectives.add('readyButton', 'Click ready if you connect!', {visible:me()!=player}, {name:'READY', action:'readyButtonInvoke'});
		player.objectives.add('selectModeWaiting', 'Wait until host is selecting map.', {visible:false});
	}
}

function readyButtonInvoke() {
	var myName:Dynamic = me();
	invokeHost('invokeHostPlayerRdy',[myName]);
}

function mapPlayers() {
    for (p in state.players) {
        for (i in 0...totalPlayerNumber) {
            if (p.clan == clanOrder[i]) {
                players[i] = p;
				if (p.isAI) aiCount++;
				else playersCount++;
            }
        }
    }
}

function createTeamsWithOnePlayerList() {
	for (i in 0...totalTeamNumber) {
		teamsWithOnePlayer[i] = !players[i*2].isAI || !players[i*2+1].isAI;
	}
	if (debugTime) debug('TeamsWithOnePlayer array:'+ teamsWithOnePlayer);
}

//thats fix lore Snake
function snakeStolenLoreCheck() {
	if (!snakeLorePicked && (
	  players[6].hasTech(Tech.Harpoons)
	||players[6].hasTech(Tech.Frenzy)
	||players[6].hasTech(Tech.Ascetic)
	||players[6].hasTech(Tech.Osmosis)
	||players[6].hasTech(Tech.FromBeyond)
	||players[6].hasTech(Tech.CityBuilder)
	||players[6].hasTech(Tech.MoreAssign)
	||players[6].hasTech(Tech.BuildingUpkeep)
	||players[6].hasTech(Tech.GameDinner)
	||players[6].hasTech(Tech.AncestralInfluence)
	||players[6].hasTech(Tech.GreatExplorers))) {
		snakeLorePicked = true;
		players[6].unlockTech(Tech.StolenLore, true);
	}
}

function checkPrestige() {
	for (player in 0...orderedPlayers.length) {
		if (orderedPlayers[player].getResource(Resource.Prestige) >= victoryPrestige) orderedPlayers[player].customVictory('YEAPPYYY you buy all island', 'Your clan was buyed by '+orderedPlayers[player].name+'!');
		for (stage in 0...prestigeStages.length) {

			if (orderedPlayers[player].getResource(Resource.Prestige) >= prestigeStages[stage] && prestigeDrakkarCounter[player] <= stage) {
				for (p in players) {
					var r:Dynamic = orderedPlayers[player];
					invoke(p, 'invokeNotifys', [r,stage]);
				}
				for (i in 0...resKind.length) {
					orderedPlayers[player].addResource(resKind[i],resourcesSupplys[i][stage],false);
				}
				prestigeDrakkar(player, prestigeSupplys[stage]);
				if (debugTime) debug('drakkarCounter array:' + prestigeDrakkarCounter);
			}
		}
	}
}

function prestigeDrakkar(playerId : Int, militiaNumber : Int) {
	var army = [for(i in 0...militiaNumber) Unit.Militia];
	drakkar(orderedPlayers[playerId], mainTiles[mode][playerId], seaTiles[mode][playerId], drakkarSpawnX, drakkarSpawnY, army, drakkarSpeed);
	prestigeDrakkarCounter[playerId]++;
}

function makeFormattedParagraph(s : String) : String { return "<p>"+s+"</p>"; }
function makeFormattedHeader(s : String) : String { return "<p align='center'><font face='BigTitle'>"+s+"</font></p>"; }
function setModDescription() : Void {
	var description = "";
	description += makeFormattedParagraph("Welcome to superdupermegacool map, there is map like usseal northgard, but better.You have many ways to win, like new traid win or rebalanced fame wic, and lore wic. OR just get sword and kill all enemes.");
	description += makeFormattedHeader("Rules:");
	description += makeFormattedParagraph("1. Collect enough <b>1000</b> [Prestige] to win!<br />");
	description += makeFormattedParagraph("2. Capture <b>"+fameTilesNeeded[mode]+"</b> tiles and <b>"+fameAmountNeeded[mode][fameAmountNeeded[mode].length-1]+"</b> [fame] to win by fame!<br />");
	description += makeFormattedParagraph("3. Try to win by lore!<br />");
	description += makeFormattedParagraph("4. KILL ALL!<br /><br />");
	description += makeFormattedHeader("New Mechanics:");
	description += makeFormattedParagraph("1. More happynes produce you more food.<br />");
	description += makeFormattedParagraph("2. Reworked all lore tree and balanced for this map.<br />");
	description += makeFormattedParagraph("3. You not need to scout tiles if you not really want. Game will open tile when time is come.<br />");
	description += makeFormattedParagraph("4. Reworked war tree, guardian great again! Strategy and conquer reworked too.<br /><br />");
	description += makeFormattedParagraph("I cant write all stuff what i add in this map, read all changes in workshop.");
	description += makeFormattedParagraph(""); // placeholder to prevent text cutting
	state.scriptDesc = description;
}

function invokeHappyNotifys(amountFood) {
	sfx(UiSfx.NewFameTitle, 0.5);
	me().genericNotify('Your workers so happy, that\'s why they work better and produce extra '+amountFood+'[Food] for clan');
}

function invokeNotifysMoney(money) {
	me().genericNotify('You gained from Bragaful extra '+toInt(money)+' gold!',me().getTownHall());
}

function invokeNotifys(player,stage) {
	sfx(UiSfx.NewFameTitle, 0.5);
	if (player == me()) {
		me().genericNotify('You already have reached '+prestigeStages[stage]+' [Prestige] to win by Trade victory! New riches are coming to you!',me().getTownHall());
		me().genericNotify(prestigeNotifyText[stage]);
	}
	else me().genericNotify((player:Player).name+' has already reached '+prestigeStages[stage]+' [Prestige] to win by Trade victory!',player.getTownHall());
}

function invokeFameNotifys(player,fame,mode) {
	sfx(UiSfx.NewFameTitle, 0.5);
	var fNeedeed = fameAmountNeeded[mode][fameAmountNeeded[mode].length-1] - fame;
	var fNeedMax = fameAmountNeeded[mode][fameAmountNeeded[mode].length-1];
	if (player == me()) {
		me().genericNotify('You already have reached '+fame+' [Fame]! You need '+fNeedeed+' more [Fame] and '+fameTilesNeeded[mode]+' tiles with altar to win!.',me().getTownHall());
	}
	else me().genericNotify((player:Player).name+' has already reached '+fame+' [Fame] to win! He need '+fNeedMax+' [Fame] and '+fameTilesNeeded[mode]+' tiles to win.',player.getTownHall());
}

function invokeResFromElfs() {
	sfx(UiSfx.NewFameTitle, 0.5);
	me().genericNotify('You found 15 [Stone]. These are the treasures that the elfs hid from you');
}

function invokeResFromJottans() {
	sfx(UiSfx.NewFameTitle, 0.5);
	me().genericNotify('You found 100 [Money], 15 [Stone], 100 [Wood]. These are the treasures that the jotuns hid from you');
}

//this methods didnt work, coz shiro didnt fix it yet

//var prestigeActive = false;

//function alarmNotification() {
//	for (player in players) {
//		player.objectives.add('Prestige', '[Prestige]!', {
//			visible: true, //visible: false,
//			showProgressBar: true,
//			showOtherPlayers: true,
//			goalVal: 1000
//		});
//	}
//}

//function invokeObjectives() {
//	for (currentPlayer in players) {
//		@sync for (otherPlayer in players) {
//			if (otherPlayer == currentPlayer) {
//				currentPlayer.objectives.setCurrentVal('Prestige', currentPlayer.getResource(Resource.Prestige));
//			}
//			else {
//				otherPlayer.objectives.setOtherPlayerVal('Prestige', currentPlayer, currentPlayer.getResource(Resource.Prestige));
//			}
//		}
//	}
//}

//function updatePrestige() {
//	for (player in players) {
//		if (player.getResource(Resource.Prestige) > 0) {
//			if (!prestigeActive) {
//				prestigeActive = true;
//				for (player in players) {
//					player.objectives.setVisible('Prestige', true);
//				}
//			}
//			else
//				invoke(player, 'invokeObjectives', []);
//		}
//	}
//}