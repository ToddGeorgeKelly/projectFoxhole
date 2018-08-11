
/// @description Insert description here
// You can write your code in this editor
var timesToRun = irandom_range(10, 30)
var xrate = irandom_range(-8,8)
var yrate = irandom_range(-8,8)

scr_mvmt_moveByXYRate(obj_npcPam, xrate, yrate, 3, false, false, timesToRun)





alarm_set(0, 6)