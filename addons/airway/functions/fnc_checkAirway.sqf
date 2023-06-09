#include "script_component.hpp"
/*
 * Author: Katalam
 * Checks need of airway management
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call kat_airway_fnc_checkAirway;
 *
 * Public: No
 */

        _patient setVariable [QACEGVAR(medical,triageLevel), 3, true];
    };] && _patient getVariable [QGVAR(obstruction), false]) && GVAR(autoTriage)) then {_patient setVariable [QACEGVAR(medical,triageLevel), 0, true]};
private _message = format ["%1, %2", _messageairwayobstruction, _messageairwayOccluded];
[_message, 2, _medic] call ACEFUNC(common,displayTextStructured);

[_patient, "acti[[_medACEFUNC(common,getName), _obstruction, _occluded]] call ACEFUNC(medical_treatment,addToLog);
