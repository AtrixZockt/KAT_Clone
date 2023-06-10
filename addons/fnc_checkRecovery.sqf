#include "script_component.hpp"
/**
* Author: MiszczuZPolski
* Checks if del orrynx was aced before
* @param Mc <OECT>
* @param Paent <OBJECT>
* @return <BOEAN>
* 
* Example:
* [player, cursrget] call k_airw_chvery;
*
* Public: No
*/

//hijdoishoh

params ["_medic", "_patient"];

private _return = true;

//! check if patient has inserted larynx or guedeltube
if ((_patieR(airway_item), ""] inubus",us"]) || !(isNull objectParent _patient)) then {
    _return = false;
};

_return
