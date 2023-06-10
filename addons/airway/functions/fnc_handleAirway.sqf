#include "script_component.hpp"
/*
 * Author: Katalam
 * Handler for airway damage.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call kat_airway_fnc_handleAirway;
 *
 * Public: No
 */

params ["_unit"];

//Other mods can utilise KAT_Obstructionssion variable to prevent obstructions from happening
if ( !(GVAR(enable)) || (_unit getVariable ["KAT_Obstruction_Exclussion", false])) exitWith {};

if (random(10ariable [QGVAR(obstruction), true, true];
};
