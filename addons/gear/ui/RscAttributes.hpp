#include "RscDefines.hpp"

//https://github.com/acemod/ACE3/blob/master/addons/zeus/ui/RscAttributes.hpp


class GVAR(RscStatic_gear) {
  style = 2;
  text = "";
  colorBackground[] = {0,0,0,0};
  colorText[] = {1,1,1,1};
  font = "PuristaMedium";
  sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
  x = safeZoneX + safeZoneW * 0.3;
  w = safeZoneW * 0.06;
  h = safeZoneH * 0.035;
};
class GVAR(RscEdit_gear) {
  style = 0;
  autocomplete = "";
  colorBackground[] = {0.1,0.1,0.1,0.9};
  colorDisabled[] = {0.5,0.5,0.5,0.9};
  colorSelection[] = {0.5,0.5,0.5,0.25};
  colorText[] = {1,1,1,1};
  font = "PuristaMedium";
  sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
  x = safeZoneX + safeZoneW * 0.365;
  w = safeZoneW * 0.33;
  h = safeZoneH * 0.035;
};

class GVAR(RscSetSaved) {
  idd = -1;
  onLoad = QUOTE(_this call FUNC(prepSaved););

  class ControlsBackground {
    class GVAR(RscStatic_background) {
      type = CT_STATIC;
      idc = -1;
      x = safeZoneX + safeZoneW * 0.294;
      y = safeZoneY + safeZoneH * 0.2257;
      w = safeZoneW * 0.41;
      h = safeZoneH * 0.37;
      style = 0;
      text = "";
      colorBackground[] = {0.1,0.1,0.1,0.75};
      colorText[] = {0,0,0,1};
      font = "PuristaMedium";
      sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    };
  };
class Controls {
  class GVAR(Rsc_title) {
    type = CT_STATIC;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.296;
    y = safeZoneY + safeZoneH * 0.23;
    w = safeZoneW * 0.4;
    h = safeZoneH * 0.036;
    style = 2;
    text = "Gear selection";
    colorBackground[] = {0.4,0.4,0.4,0};
    colorText[] = {1,1,1,1};
    font = "PuristaMedium";
    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);
  };

  //LABELS
  class GVAR(RscStatic_gearDefault) : GVAR(RscStatic_gear) {
    type = CT_STATIC;
    idc = -1;
    y = safeZoneY + safeZoneH * 0.30;
    text = "Default:";
  };
  class GVAR(RscStatic_gearLeader) : GVAR(RscStatic_gear) {
    type = CT_STATIC;
    idc = -1;
    y = safeZoneY + safeZoneH * 0.35;
    text = "Leader:";
  };
  class GVAR(RscStatic_gearAT) : GVAR(RscStatic_gear) {
    type = CT_STATIC;
    idc = -1;
    y = safeZoneY + safeZoneH * 0.40;
    text = "AT:";
  };
  class GVAR(RscStatic_gearAA) : GVAR(RscStatic_gear) {
    type = CT_STATIC;
    idc = -1;
    y = safeZoneY + safeZoneH * 0.45;
    text = "AA:";
  };
  class GVAR(RscStatic_gearAR) : GVAR(RscStatic_gear) {
    type = CT_STATIC;
    idc = -1;
    y = safeZoneY + safeZoneH * 0.50;
    text = "AR:";
  };

  // TEXT BOXES
  class GVAR(RscEdit_gearDefault) : GVAR(RscEdit_gear) {
    type = CT_EDIT;
    idc = CT_GEAR_DEFAULT;
    y = safeZoneY + safeZoneH * 0.30;
    text = "[]";
  };
  class GVAR(RscEdit_gearLeader) : GVAR(RscEdit_gear) {
    type = CT_EDIT;
    idc = CT_GEAR_LEADER;
    y = safeZoneY + safeZoneH * 0.35;
    text = "[]";
  };
  class GVAR(RscEdit_gearAT) : GVAR(RscEdit_gear) {
    type = CT_EDIT;
    idc = CT_GEAR_AT;
    y = safeZoneY + safeZoneH * 0.40;
    text = "[]";
  };
  class GVAR(RscEdit_gearAA) : GVAR(RscEdit_gear) {
    type = CT_EDIT;
    idc = CT_GEAR_AA;
    y = safeZoneY + safeZoneH * 0.45;
    text = "[]";
  };
  class GVAR(RscEdit_gearAR) : GVAR(RscEdit_gear) {
    type = CT_EDIT;
    idc = CT_GEAR_AR;
    y = safeZoneY + safeZoneH * 0.50;
    text = "[]";
  };

  class ButtonOk {
      type = CT_BUTTON;
      idc = -1;
      x = safeZoneX + safeZoneW * 0.365;
      y = safeZoneY + safeZoneH * 0.55;
      w = safeZoneW * 0.07;
      h = safeZoneH * 0.035;
      style = 0+2;
      text = "OK";
      borderSize = 0;
      colorBackground[] = {0,0.5,0,1};
      colorBackgroundActive[] = {0.25,0.75,0.25,1};
      colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
      colorBorder[] = {0,0,0,0};
      colorDisabled[] = {0.2,0.2,0.2,1};
      colorFocused[] = {0.2,0.2,0.2,1};
      colorShadow[] = {0,0,0,0};
      colorText[] = {1,1,1,1};
      font = "PuristaMedium";
      offsetPressedX = 0.01;
      offsetPressedY = 0.01;
      offsetX = 0.01;
      offsetY = 0.01;
      sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.5);
      soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
      soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
      soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
      soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
      onButtonClick = QUOTE(_this call FUNC(setSaved););
  };
  };
};
