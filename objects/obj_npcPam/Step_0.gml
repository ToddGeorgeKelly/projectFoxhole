var timesToRun = irandom_range(10, 30)
var xrate = irandom_range(-8,8)
var yrate = irandom_range(-8,8)

scr_mvmt_moveByXYRate(obj_npcPam, xrate, yrate, 3, false, false, 100)


_scr_mvmt_runEngine()
