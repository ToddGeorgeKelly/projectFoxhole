


//MOVEMENT
#macro KEY_UP ord("W")
#macro KEY_DOWN ord("S")
#macro KEY_LEFT ord("A")
#macro KEY_RIGHT ord("D")

moveSpeed = 4

standRight = spr_timStandRIght
standUp = spr_timStandUp
standLeft = spr_timStandLeft
standDown = spr_timStandDown

walkRight = spr_timWalkRight
walkUp = spr_timWalkUp
walkLeft = spr_timWalkLeft
walkDown = spr_timWalkDown



//COLLISION
collisionBuffer = moveSpeed + 2