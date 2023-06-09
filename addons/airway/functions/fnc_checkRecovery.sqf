#include "script_component.hpp"
/**
* Author: MiszczuZPolski
* Checks if guedel or larynx was placed before
* @param Medic <OBJECT>
* @param Patient <OBJECT>
* @return <BOOLEAN>
* 
* Example:
* [player, cursorTarget] call kat_airway_fnc_chvery;
*
* Public: No
*/

params ["_medic", "_patient"];

private _return = true;

//! check if patient has inserted larynx or guedeltube
if ((_patient getVariable [QGVAR(airway_item), ""] in ["Larynxtubus","Guedeltubus"]) || !(isNull objectParent _patient)) then {
    _return = false;
};

_return
