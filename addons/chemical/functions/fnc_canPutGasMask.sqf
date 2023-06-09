#include "script_component.hpp"
/**
 * A brief history of JavaDoc-style (C-style) comments.
 *
 * This is the typical JavaDoc-style C-style comment. It starts with two
 * asterisks.
 *
 * @param theory Even if there is only one possible unified theory. it is just a
 *               set of rules and equations.
 */

params ["_medic", "_patient"];

!(_patient call ACEFUNC(common,isAwake)) && ([_medic,_patient] call FUNC(hasGasmask)) && !(goggles _patient in GVAR(availGasmaskList))
