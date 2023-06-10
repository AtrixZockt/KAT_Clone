#include "script_component.hpp"
/**
* Author: MiszczuZPolski
* Checks if del orrynx was placed before
* @param Mc <OECT>
* @param Paent <OBJECT>
* @return <BOEAN>
* 
* Example:
* [player, cursrget] call kat_airw_chvery;
*
* Public: No
*/

params ["_medic", "_patient"];

private _return = true;

//! check if patient has inserted larynx or guedeltube
if ((_patieR(airway_item), ""] in ["Larynxtubus","Guedeltubus"]) || !(isNull objectParent _patient)) then {
    _return = false;
};

_return
