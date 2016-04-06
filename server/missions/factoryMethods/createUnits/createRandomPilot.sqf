//	@file Name: createRandomSoldier.sqf
/*
 * Creates a random civilian soldier.
 *
 * Arguments: [ position, group, init, skill, rank]: Array
 *    position: Position - Location unit is created at.
 *    group: Group - Existing group new unit will join.
 *    init: String - (optional, default "") Command to be executed upon creation of unit. Parameter this is set to the created unit and passed to the code.
 *    skill: Number - (optional, default 0.5)
 *    rank: String - (optional, default "PRIVATE")
 */

if (!isServer) exitWith {};

private ["_soldierTypes","_uniformTypes","_vestTypes","_weaponTypes","_group","_position","_soldier"];

_soldierTypes = ["C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F"];
_uniformTypes = ["U_B_HeliPilotCoveralls"];
_vestTypes = ["V_PlateCarrier1_rgr","V_PlateCarrier2_rgr"];
_weaponTypes = ["srifle_GM6_F","srifle_GM6_camo_F"];


_group = _this select 0;
_position = _this select 1;

_soldier = _group createUnit [_soldierTypes call BIS_fnc_selectRandom, _position, [], 0, "NONE"];
_soldier addUniform (_uniformTypes call BIS_fnc_selectRandom);
_soldier addVest (_vestTypes call BIS_fnc_selectRandom);
_soldier addBackpack "B_Parachute";
[_soldier, _weaponTypes call BIS_fnc_selectRandom, 3] call BIS_fnc_addWeapon;
_soldier addPrimaryWeaponItem "optic_LRPS";

sleep 0.1; // Without this delay, headgear doesn't get removed properly

removeAllAssignedItems _soldier;
_soldier addHeadgear "H_PilotHelmetHeli_B";

_soldier addEventHandler ["Killed", {_this call server_playerDied; (_this select 1) call removeNegativeScore}];

_soldier
