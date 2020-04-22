

//https://github.com/acemod/ACE3/blob/master/addons/zeus/ui/RscAttributes.hpp


class GVAR(RscStatic_gear) {
  style = 2;
  text = "";
  colorBackground[] = {0,0,0,0};
  colorText[] = {0,0,0,1};
  font = "PuristaMedium";
  sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);

};
class GVAR(RscEdit_gear) {
  style = 0;
  autocomplete = "";
  colorBackground[] = {0.702,0.702,0.702,1};
  colorDisabled[] = {0.2,0.2,0.2,1};
  colorSelection[] = {1,0,0,1};
  colorText[] = {0,0,0,1};
  font = "PuristaMedium";
  sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 2);

};

class GVAR(RscSetSaved) {
  idd = -1;

  class ControlsBackground {
    class GVAR(RscStatic_background) {
      type = 0;
      idc = -1;
      x = safeZoneX + safeZoneW * 0.29394532;
      y = safeZoneY + safeZoneH * 0.22569445;
      w = safeZoneW * 0.41210938;
      h = safeZoneH * 0.54861112;
      style = 0;
      text = "";
      colorBackground[] = {0.902,0.902,0.902,1};
      colorText[] = {0,0,0,1};
      font = "PuristaMedium";
      sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    };
  };
class Controls {
  class GVAR(Rsc_title) {
    type = 0;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.29394532;
    y = safeZoneY + safeZoneH * 0.22569445;
    w = safeZoneW * 0.41210938;
    h = safeZoneH * 0.08680556;
    style = 2;
    text = "Gear selection";
    colorBackground[] = {0.6,0.6,0.6,0};
    colorText[] = {0,0,0,1};
    font = "PuristaMedium";
    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 3);
  };
  class GVAR(RscEdit_gearLeader) {
    type = 2;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.44042969;
    y = safeZoneY + safeZoneH * 0.42013889;
    w = safeZoneW * 0.265625;
    h = safeZoneH * 0.0625;
    text = "[]";
  };
  class GVAR(RscEdit_gearAT) {
    type = 2;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.44042969;
    y = safeZoneY + safeZoneH * 0.49305556;
    w = safeZoneW * 0.265625;
    h = safeZoneH * 0.0625;
    text = "[]";
  };
  class GVAR(RscEdit_gearAA) : GVAR(RscEdit_gear) {
    type = 2;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.44042969;
    y = safeZoneY + safeZoneH * 0.56597223;
    w = safeZoneW * 0.265625;
    h = safeZoneH * 0.0625;
    text = "[]";
  };
  class GVAR(RscEdit_gearAR) : GVAR(RscEdit_gear) {
    type = 2;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.44042969;
    y = safeZoneY + safeZoneH * 0.63888889;
    w = safeZoneW * 0.265625;
    h = safeZoneH * 0.0625;
    text = "[]";
  };
  class GVAR(RscStatic_gearDefault) : GVAR(RscStatic_gear) {
    type = 0;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.29394532;
    y = safeZoneY + safeZoneH * 0.34722223;
    w = safeZoneW * 0.14355469;
    h = safeZoneH * 0.0625;
    text = "Default:";
  };
  class GVAR(RscEdit_gearDefault) : GVAR(RscEdit_gear) {
    type = 2;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.44042969;
    y = safeZoneY + safeZoneH * 0.34722223;
    w = safeZoneW * 0.265625;
    h = safeZoneH * 0.0625;
    text = "[]";
  };
  class GVAR(RscStatic_gearLeader) : GVAR(RscStatic_gear) {
    type = 0;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.29394532;
    y = safeZoneY + safeZoneH * 0.42013889;
    w = safeZoneW * 0.14355469;
    h = safeZoneH * 0.0625;
    text = "Leader:";
  };
  class GVAR(RscStatic_gearAT) : GVAR(RscStatic_gear) {
    type = 0;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.29394532;
    y = safeZoneY + safeZoneH * 0.49305556;
    w = safeZoneW * 0.14355469;
    h = safeZoneH * 0.0625;
    text = "AT:";
  };
  class GVAR(RscStatic_gearAA) : GVAR(RscStatic_gear) {
    type = 0;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.29394532;
    y = safeZoneY + safeZoneH * 0.56597223;
    w = safeZoneW * 0.14355469;
    h = safeZoneH * 0.0625;
    text = "AA:";
  };
  class GVAR(RscStatic_gearAR) : GVAR(RscStatic_gear) {
    type = 0;
    idc = -1;
    x = safeZoneX + safeZoneW * 0.29394532;
    y = safeZoneY + safeZoneH * 0.63888889;
    w = safeZoneW * 0.14355469;
    h = safeZoneH * 0.0625;
    text = "AR:";
  };
  class ButtonOk {
      type = 1;
      idc = -1;
      x = safeZoneX + safeZoneW * 0.39160157;
      y = safeZoneY + safeZoneH * 0.71180556;
      w = safeZoneW * 0.0703125;
      h = safeZoneH * 0.04166667;
      style = 0+2;
      text = "OK";
      borderSize = 0;
      colorBackground[] = {0,0.5082,0,1};
      colorBackgroundActive[] = {1,0,0,1};
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
      onButtonClick = "hint str _this;";
  };
  };
};
