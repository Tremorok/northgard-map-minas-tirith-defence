var isDebug = true;
var GAMEDATA = {
	USERDEFEATED : false, //check, does player defeted
	OBJECTIVESINITED : false,
	BUILDINGBURNDISABLED : false,
	VILLAGERSUNITSSPAWNED : false,
	WAYCOUNTER : -1, // way counter
	USERRESOURCES : {
		SOMERES : 0
	},
	TILES : {
		MAIN : getZone(60), // main tile, where all mobs from ways are going
		STARTEDLAND : getZone(51), // started zone, where player army spawned
		SMITHERZONE : getZone(64),
		SPAWNERS : {
			LEFT : getZone(138), // left spawner
			MIDDLE : getZone(95), // middle spawner
			RIGHT : getZone(37) // right spawner
		},
		BLOCKEDTOSCOUT : [17,29,22,28,20,24,21,26,18,32,31,46,58,73,93,110,120,142,153,168,166,175,
			178,184,203,222,235,230,211,193,175,186,205,220,237,227,210,197,232,228,239,225,233,223,213,
			198,202,185,182,172,195,176,170,167,149,135,117,96,80,68,225,234,216,215,224,196,219,214,199,
			204,189,181,127,132,150,164,157,139], //blocked zones for scouting
		OPENEDTILES : [],
		ALWAYSOPENEDTILES : [116,101,104,91,97,87,89,78,81,70,59,52,40,33,84,71,76,64,48,34,42,51,60], //array of pre discovered tiles
		CASTLEZONES : [for(i in [116,101,104,91,97,87,89,78,81,70,59,52,40,33,84,71,76,64,48,34,42,51,60]) getZone(i)],
		SYSTEMZONES : [for(i in [226,216,196,224,234,215]) getZone(i)] //system zones (like player townhall)
	},
	WAYS : [
		{
			SPAWNTIME : 5, //when way started (in sec)
			SPAWNED : false, //check, does way already spawned
			LEFT : [ //array of mobs to the left spawner
				{u:Unit.Death, nb:8},
				{u:Unit.WhiteWolf, nb:4}
			],
			MIDDLE : [ //array of mobs to the middle spawner
				{u:Unit.Death, nb:8},
				{u:Unit.WhiteWolf, nb:4}
			],
			RIGHT : [ //array of mobs to the right spawner
				{u:Unit.Death, nb:8},
				{u:Unit.WhiteWolf, nb:4}
			]
		},
		{
			SPAWNTIME : 160,
			SPAWNED : false,
			LEFT : [
				{u:Unit.GiantBoar, nb:1},
				{u:Unit.Death, nb:5},
				{u:Unit.Myrkalfar, nb:2},
				{u:Unit.WhiteWolf, nb:4}
			],
			MIDDLE : [
				{u:Unit.GiantBoar, nb:1},
				{u:Unit.Death, nb:5},
				{u:Unit.Myrkalfar, nb:2},
				{u:Unit.WhiteWolf, nb:4}
			],
			RIGHT : [
				{u:Unit.GiantBoar, nb:1},
				{u:Unit.Death, nb:5},
				{u:Unit.Myrkalfar, nb:2},
				{u:Unit.WhiteWolf, nb:4}
			]
		},
		{
			SPAWNTIME : 260,
			SPAWNED : false,
			LEFT : [
				{u:Unit.UndeadGiant, nb:1},
				{u:Unit.RevivedCarcass, nb:2},
				{u:Unit.Dragonmen, nb:3},
				{u:Unit.Kobold, nb:4}
			],
			MIDDLE : [
				{u:Unit.UndeadGiant, nb:1},
				{u:Unit.RevivedCarcass, nb:2},
				{u:Unit.Dragonmen, nb:3},
				{u:Unit.Kobold, nb:4}
			],
			RIGHT : [
				{u:Unit.UndeadGiant, nb:1},
				{u:Unit.RevivedCarcass, nb:2},
				{u:Unit.Dragonmen, nb:3},
				{u:Unit.Kobold, nb:4}
			]
		},
		{
			SPAWNTIME : 360,
			SPAWNED : false,
			LEFT : [
				{u:Unit.IceGolem, nb:1},
				{u:Unit.UndeadGiant, nb:1},
				{u:Unit.RevivedCarcass, nb:1},
				{u:Unit.Dragonmen, nb:5},
				{u:Unit.Myrkalfar, nb:2}
			],
			MIDDLE : [
				{u:Unit.IceGolem, nb:1},
				{u:Unit.UndeadGiant, nb:1},
				{u:Unit.RevivedCarcass, nb:1},
				{u:Unit.Dragonmen, nb:5},
				{u:Unit.Myrkalfar, nb:2}
			],
			RIGHT : [
				{u:Unit.IceGolem, nb:1},
				{u:Unit.UndeadGiant, nb:1},
				{u:Unit.RevivedCarcass, nb:1},
				{u:Unit.Dragonmen, nb:5},
				{u:Unit.Myrkalfar, nb:2}
			]
		},
		{
			SPAWNTIME : 460,
			SPAWNED : false,
			LEFT : [
				{u:Unit.UndeadGiant, nb:1},
				{u:Unit.GiantSlave, nb:1},
				{u:Unit.RevivedCarcass, nb:1},
				{u:Unit.ColossalBoar, nb:1},
				{u:Unit.IceGolem, nb:1},
				{u:Unit.Dragonmen, nb:5},
				{u:Unit.WhiteWolf, nb:2},
				{u:Unit.Myrkalfar, nb:3},
				{u:Unit.Kobold, nb:5}
			],
			MIDDLE : [
				{u:Unit.UndeadGiant, nb:1},
				{u:Unit.GiantSlave, nb:1},
				{u:Unit.RevivedCarcass, nb:1},
				{u:Unit.ColossalBoar, nb:1},
				{u:Unit.IceGolem, nb:1},
				{u:Unit.Dragonmen, nb:5},
				{u:Unit.WhiteWolf, nb:2},
				{u:Unit.Myrkalfar, nb:3},
				{u:Unit.Kobold, nb:5}
			],
			RIGHT : [
				{u:Unit.UndeadGiant, nb:1},
				{u:Unit.GiantSlave, nb:1},
				{u:Unit.RevivedCarcass, nb:1},
				{u:Unit.ColossalBoar, nb:1},
				{u:Unit.IceGolem, nb:1},
				{u:Unit.Dragonmen, nb:5},
				{u:Unit.WhiteWolf, nb:2},
				{u:Unit.Myrkalfar, nb:3},
				{u:Unit.Kobold, nb:5}
			]
		}
	]
};
var timer = 0.0; //game timer
var player : Player = null;
var aiSaruman : Player = null;
var aiDefenders : Player = null;

var allSpawnedLiveUnits : Array<Unit> = []; //Storage of all alive mobs from ways
var unitsSplitedByLands : Array<{
		ID:Int, // id zone
		HASPLAYERUNITS:Bool, // check, does player units in the same zone with mobs
		NEARTILEWITHPLAYERUNITS:Int, // near tile with player units
		UNITS:Array<Unit>
	}> = []; // array of data with info about mobs from ways

var ARMY = {
	UNITTODEF : null,
	HEROES : {
		GENDOLF : null,
		DENETOR : null,
		PIPIN : null
	},
	STARTEDARMY : [
		{u:Unit.Warrior, nb:5},
		{u:Unit.ShieldBearer02, nb:2},
		{u:Unit.Bowman, nb:3},
		{u:Unit.Paladin, nb:1}
	],
	CURARMY : []
};

function init() {
	addObjectives();
    if (state.time == 0) {
		if (isDebug) debug("Init");
		noEvent();
		catchUser();
		addRules();
		hideAndCleanSystemZones();
		initStartedArmy();
		discoverOpenedTiles();
		moveCamera({x:180,y:180});
		//talk("Lol");

		if (isDebug) {
			//player.discoverAll(); //Открываем всю карту
		}
		if (isDebug) debug("end init");
	}
}

function regularUpdate(dt : Float) {
	// if (timer % 10 == 0) {
	// 	if (isDebug) debug("update:" + timer);
	// }
	@split [
		disableBurnForBuildings(),
		//spawnUnits(),
		wayChecker(),
		//debug("0"),
		wayAnnonser(),
		//debug("1"),
		deleteDeadUnits(),
		//debug("2"),
		mobsMover(),
		//debug("3"),
		fogUpdater(),
		//debug("4"),
		addResources(),
		//debug("5"),
		defeatCheck()
		//healPeople()
	];
	timer += 0.5;
	if (timer % 10 == 0) {
		debug("regUpd alive");
	}
}

function spawnUnits() {

	var villagersTypes:Array<UnitKind> = [
		Unit.Villager,
		Unit.VillagerWoman,
		Unit.Norn,
		Unit.Mender,
		Unit.Cook,
		Unit.Skald,
		Unit.RuneMaster,
		Unit.Peon,
		Unit.Woodcutter02,
		Unit.Farmer02,
		Unit.Priest,
		Unit.Merchant02];

	aiDefenders.addBonus({id:ConquestBonus.BOffensiveCivilian});
	//@sync {
		//player.getFactionRelation(getFaction("Jottans"));
		//RelationCommon.al
		for (zone in GAMEDATA.TILES.CASTLEZONES) {
			var cntOfSpawnedUnits = 0;

			@sync for (i in 0...3) {
				var rndCnt:Int = math.round(math.random(4));
				var rndType:Int = math.round(math.random(villagersTypes.length));
				cntOfSpawnedUnits += rndCnt;
				var units = zone.addUnit(villagersTypes[rndType],rndCnt,aiDefenders);
				@sync for (unit in units) {
					unit.setUnitFlag(UnitFlag.DisableControl,true);
					unit.setUnitFlag(UnitFlag.CantDie,true);
					unit.setUnitFlag(UnitFlag.IsDefending,false);
					unit.setUnitFlag(UnitFlag.IsInvincible,true);
					unit.setUnitFlag(UnitFlag.NoRepel,true);
					unit.owner = getFaction("Jottans").asPlayer();
					//unit.scriptVisible = false;
				}

			}
			debug("id:"+zone.id+" cnt:"+cntOfSpawnedUnits);
			wait(0.5);
		}
	//}

	if (GAMEDATA.VILLAGERSUNITSSPAWNED) {return;}
	GAMEDATA.VILLAGERSUNITSSPAWNED = true;
	GAMEDATA.TILES.SMITHERZONE.takeControl(player);
	GAMEDATA.TILES.SMITHERZONE.addUnit(Unit.Smith,2,player);
}

function addObjectives() {
	if (!GAMEDATA.OBJECTIVESINITED) {
		debug('objectives init');
		GAMEDATA.OBJECTIVESINITED = true;
		me().objectives.add('readyButton', "", {visible:true}, {name:'Press me', action:'spawnUnits'});
		me().objectives.add("resInfo", "Your gold [Money].", {visible:true, showProgressBar:true});
		debug('objectives inited');
	}
}

function readyButtonInvoke() {
	debug('Click');
	GAMEDATA.USERRESOURCES.SOMERES++;
	me().objectives.setGoalVal("resInfo",GAMEDATA.USERRESOURCES.SOMERES);
	me().objectives.setCurrentVal("resInfo",GAMEDATA.USERRESOURCES.SOMERES);
}

function disableBurnForBuildings() {

	if (GAMEDATA.BUILDINGBURNDISABLED) {return;}
	GAMEDATA.BUILDINGBURNDISABLED = true;

	var allZonesInGame = state.zones;
	@sync for (zone in allZonesInGame) {
		var buildings = zone.buildings;
		@sync for (building in buildings) {
			building.setFlag(BuildingFlag.CantBurn,true);
		}
	}
}

function discoverOpenedTiles() {
	for (zone in GAMEDATA.TILES.ALWAYSOPENEDTILES) {
		player.discoverZone(getZone(zone));
	}
}

function initStartedArmy() {
	ARMY.HEROES.GENDOLF = getZone(64).addUnit(Unit.Einherjar,1,player)[0];
	ARMY.HEROES.DENETOR = GAMEDATA.TILES.STARTEDLAND.addUnit(Unit.Nominoe,1,player)[0];
	ARMY.HEROES.PIPIN = GAMEDATA.TILES.STARTEDLAND.addUnit(Unit.ShieldBearer,1,player)[0];

	for (unit in ARMY.STARTEDARMY) {
		var u = unit.u,
			nb = unit.nb;
		ARMY.CURARMY.push(GAMEDATA.TILES.STARTEDLAND.addUnit(u,nb,player)[0]);
	}

	ARMY.UNITTODEF = GAMEDATA.TILES.MAIN.addUnit(Unit.Hero09,1,player)[0];
	ARMY.UNITTODEF.setUnitFlag(UnitFlag.DisableControl);
}

function addRules() {
	addRule(Rule.NoWinter);
	addRule(Rule.NoCalendarUpdate);
	addRule(Rule.NoBuildUI);
	//addRule(Rule.HidePlayerList);
	addRule(Rule.HealerAccess);
	//addRule(Rule.NoResUI);
	addRule(Rule.NoFactions);
	player.setModifierFlag(PlayerModifierFlag.NoConsumption, true);
	player.setModifierFlag(PlayerModifierFlag.NoVillagerSpawn, true);
	aiDefenders.setModifierFlag(PlayerModifierFlag.NoConsumption, true);
	aiDefenders.setModifierFlag(PlayerModifierFlag.NoVillagerSpawn, true);
}

function hideAndCleanSystemZones() {
	for (zone in GAMEDATA.TILES.SYSTEMZONES) {
		player.coverZone(zone);
	}
	killAllUnits(GAMEDATA.TILES.SYSTEMZONES);
}

function catchUser() {
	for (p in state.players) {
		if (p.isAI && p.clan == Clan.Wolf) {
			aiSaruman = p;
		} else if (p.isAI && p.clan == Clan.Goat) {
			aiDefenders = p;
		} else {
			player = p;
		}
	}
}

//Check ways to invoke
function wayChecker() {

	for(way in GAMEDATA.WAYS) {
		var spawnTime = way.SPAWNTIME;
		var spawned = way.SPAWNED;

		if (timer >= spawnTime && !spawned) {
			way.SPAWNED = true;
			if (isDebug) debug("Init spawning");
			@split [
				wayInvoke(way.LEFT,GAMEDATA.TILES.SPAWNERS.LEFT),
				wayInvoke(way.MIDDLE,GAMEDATA.TILES.SPAWNERS.MIDDLE),
				wayInvoke(way.RIGHT,GAMEDATA.TILES.SPAWNERS.RIGHT)
			];
			if (isDebug) debug("Way spawned2");
		}
	};
}

function wayAnnonser() {
	//state.events.(Event.WoodRequest);
}

//Invoke units to zone
function wayInvoke(unitsList,tile) {
	if (isDebug) debug("wayInvoke unitsCnt:"+unitsList.length+" tile:"+tile.id);
	var spawnedUnits : Array<Unit> = [];

	for (unit in unitsList) {
		var mobe = unit.u,
			cnt = unit.nb;

		var createdUnits = tile.addUnit(mobe,cnt,aiSaruman);

		for (cUnit in createdUnits) {
			cUnit.owner = null; //ебучий костыль
			spawnedUnits.push(cUnit);
			allSpawnedLiveUnits.push(cUnit);
		}
	}

	launchAttack(spawnedUnits,[GAMEDATA.TILES.MAIN.id]);
	sfx(UiSfx.Horn);
}

function defeatCheck() {
	if (ARMY.UNITTODEF.life <= 0.01) {
		GAMEDATA.USERDEFEATED = true;
	}

	if (GAMEDATA.USERDEFEATED) {
		player.customDefeat("А вот нужно было дэфать челика на мейне))00");
	}
}

function fogUpdater() {
	if (timer % 2 != 0) return; // update fog 1 times in 2 sec

	var charZone : Zone = ARMY.HEROES.GENDOLF.zone;
	var nearZones : Array<Zone> = charZone.next.copy();
	var nearZonesInt : Array<Int> = [];

	nearZones.push(charZone);

	//debug("0");
	@sync for (zone in nearZones) {
		var zId = zone.id;
		nearZonesInt.push(zId);
		if (!GAMEDATA.TILES.BLOCKEDTOSCOUT.contains(zId)
			&& !GAMEDATA.TILES.OPENEDTILES.contains(zId)
			&& !GAMEDATA.TILES.ALWAYSOPENEDTILES.contains(zId)) {
			@async {
				player.discoverZone(zone);
			}
			GAMEDATA.TILES.OPENEDTILES.push(zId);
		}
	}

	//debug("1");
	var iter : Int = 0;
	@sync for (zone in GAMEDATA.TILES.OPENEDTILES) {
		if (!nearZonesInt.contains(zone)
			&& !GAMEDATA.TILES.ALWAYSOPENEDTILES.contains(zone)) {
			@async {
				player.coverZone(getZone(zone));
			}
			GAMEDATA.TILES.OPENEDTILES.splice(iter,1);
		} else {
			iter++;
		}
	}
	//debug("2 "+GAMEDATA.TILES.OPENEDTILES);
}

function deleteDeadUnits() {
	var iter : Int = 0;
	for (unit in allSpawnedLiveUnits) {
		if (unit.life <= 0.01) {
			allSpawnedLiveUnits.splice(iter,1);
			//if (isDebug) debug("unit dead:"+iter);
		} else {
			iter++;
		}
	}
}

/**
 * Adding units in "unitsSplitedByLands"
 * @param \{Unit\} unit
 */

function addUnitToLandArr(unitsList : Array<Unit>) {
	@sync for (unit in unitsList) {
		var zoneId = unit.zone.id,
			exist = false;

		@sync for (land in unitsSplitedByLands) {
			var landId = land.ID;
			var units = land.UNITS;

			if (landId == zoneId) {
				units.push(unit);
				exist = true;
				break;
			}
		}
		if (!exist) {
			unitsSplitedByLands.push({
				ID : zoneId,
				HASPLAYERUNITS : false,
				NEARTILEWITHPLAYERUNITS : null,
				UNITS : [unit]
			});
		}
	}
}

function updateLandsWithUnitsInfo() {
	@sync for (elem in unitsSplitedByLands) {
		var hasPlayerUnits : Bool = false;
		var zoneId = elem.ID;
		var zUnits : Array<Unit> = getZone(zoneId).units.copy();
		var nearTileWithPlayerUnits = null;
		var nearTiles = getZone(zoneId).next;

		@sync for (unit in zUnits) {
			if (unit.owner == player) {
				hasPlayerUnits = true;
				break;
			}
		}
		@sync for (tile in nearTiles) {
			var tileId = tile.id,
				unitsInTile = tile.units;

			if (unitsInTile.length == 0) {
				continue;
			} else {
				@sync for (unit in unitsInTile) {
					if (unit.owner == player) {
						nearTileWithPlayerUnits = tileId;
						break;
					}
				}
			}
		}
		elem.NEARTILEWITHPLAYERUNITS = nearTileWithPlayerUnits;
		elem.HASPLAYERUNITS = hasPlayerUnits;
	}
}

function moveMobs() {
	@sync for (elem in unitsSplitedByLands) {
		var hasPlayerUnits = elem.HASPLAYERUNITS,
			zoneId = elem.ID,
			units = elem.UNITS,
			targetLand = hasPlayerUnits ? zoneId
				: elem.NEARTILEWITHPLAYERUNITS != null ? elem.NEARTILEWITHPLAYERUNITS
					: GAMEDATA.TILES.MAIN.id;

		if (!hasPlayerUnits) {
			launchAttack(units,[targetLand]);
		} else {
			for (unit in elem.UNITS) {
				unit.moveToZone(getZone(zoneId),true);
			}
		}

		if (hasPlayerUnits) debug("units in land");
	}
}

function mobsMover() { //я ебал, почему нужно двигать юнитов, после каждого срабатывания атаки в тайле?

	if (allSpawnedLiveUnits.length == 0) return;

	addUnitToLandArr(allSpawnedLiveUnits);
	updateLandsWithUnitsInfo();
	moveMobs();
	unitsSplitedByLands = [];
}

function addResources() {
	if (timer % 60 != 0) return;

	player.setResource(Resource.Wood,500);
	player.setResource(Resource.Money,500);
}

// function healPeople() {
// 	var healersCnt = 0;
// 	var healers = [];
// 	for (unit in ARMY.CURARMY) {
// 		if (unit.kind == Unit.Paladin) {
// 			healersCnt++;
// 			healers.push({u:unit,zone:unit.zone});
// 		}
// 	}
// }