#include "script_component.hpp"
/*
 * Author: DiGii
 * 
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [] call kat_chemical_fnc_AttributeRadius;
 *
 * Public: No
 *
 *
*/


params ["_control"];
private _displaytHandlers "SetFocus";

private _sealCheckBox = _display displayCtrl 1613;
private _sealText =
if!(isNull attachedTo _logic) then {
    _sealCheckBox ctrlShow true;
    _sealText ctrlShow true;

    _placeText ctrlSetText CSTRING(GasModule_createContaminatedObject);
} else {
    _sealCheckBox ctrlShow false;
    _sealText ctrlShow false;
    _placetext ctrlSetText CSTRING(GasModule_createContaminatedZone);
};

private _ntrol controlsGroupCtrl 1612;

_maxEdit ctrlSetText "100";
_minEdit ctrlSetText "50";

private _fnc_onKeyUp = {
    params ["_display"];

    private _maxEdit = _display displayCtrl 1611;
    private _miumber (ctrlText _minEdit);

    // Handle invalid radius (non-numerical input)
    if (_maxradius == 0) then {
        _maxEdit ctrlSetTooltip (ACELSTRING(Zeus,AttributeRadiusInvalid));
        _maxEdit ctrlSetTextColor [1,0,0,1];
    } else {
        _maxEdit ctrlSetTooltip "";
        _maxEdit ctrlSetTextColor [1,1,1,1];
        _display setVariable [QGVAR(ui_radiusMax),_maxradius];
    };

        if(_minradius > _maxradius) then {
            _minEdit ctrlSetTooltip (ACELSTRING(Zeus,AttributeRadiusInvalid));
            _minEdit ctrlSetTextColor [1,0,0,1];
        } else {
            _minEdit ctrlSetTooltip "";
            _minEdit ctrlSetTextColor [1,1,1,1];
            _display setVariable [QGVAR(ui_radiusMin),_minradius];
        };
    };
};

private _fnc_onCheckChange = {
    params["_sealCheckBox"];
    _display = ctrlParent _sealCheckBox;
    private _canBeSealed = cbChecked(_display displayCtrl 1613);
    _display setVariable [QGVAR(ui_sealable),_canBeSealed];
};

private _fnc_onLBSelChange = {
    params["_gasTypeCombo"];
    _display = ctrlParent _gasTypeCombo;
    private _gastype = lbCurSel _gasTypeCombo;
    _display setVariable [QGVAR(ui_gastype),_gastype];
};

[_display] call _fnc_onKeyUp;
[_sealCheckBox] call _fnc_onCheckChange;
[_gasTypeCombo] call _fnc_onCheckChange;
_display displayAddEventHandler ["KeyUp", _fnc_onKeyUp];
_sealCheckBox ctrlAddEventHandler ["CheckedChanged", _fnc_onCheckChange]; 
_gasTypeCombo ctrlAddEventHandler ["LBSelChanged", _fnc_onLBSelChange]; 
