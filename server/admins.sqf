// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: server\admins.sqf

if (!isServer) exitWith {};

if (loadFile (externalConfigFolder + "\admins.sqf") != "") then
{
	call compile preprocessFileLineNumbers (externalConfigFolder + "\admins.sqf");
}
else
{
	// Admin menu (U key) access levels

	/*******************************************************
	 Player UID examples :

		"1234567887654321", // Meatwad
		"8765432112345678", // Master Shake
		"1234876543211234", // Frylock
		"1337133713371337"  // Carl

	 Important: The player UID must always be placed between
	            double quotes (") and all lines need to have
	            a comma (,) except the last one.
	********************************************************/

	// Low Administrators: manage & spectate players, remove hacked vehicles
	lowAdmins = compileFinal str
	[
	
	];

	// High Administrators: manage & spectate players, remove hacked vehicles, show player tags
	highAdmins = compileFinal str
	[
		// Put player UIDs here
	];

	// Server Owners: access to everything, including god mode, money, guns, and vehicles
	serverOwners = compileFinal str
	[
		"76561197963583607", // Moltar - Ryan
	    "76561198118623376", // Anthony - Anthony
		"76561198075040029", // Manizzle - Manizzle
		"76561198025531554" // Jaeger - Jaeger
	];

	/********************************************************/
};

if (typeName lowAdmins == "ARRAY") then { lowAdmins = compileFinal str lowAdmins };
if (typeName highAdmins == "ARRAY") then { highAdmins = compileFinal str highAdmins };
if (typeName serverOwners == "ARRAY") then { serverOwners = compileFinal str serverOwners };

publicVariable "lowAdmins";
publicVariable "highAdmins";
publicVariable "serverOwners";
