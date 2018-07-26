var dir = argument0
var xx = argument1
var yy = argument2
var collisionB = argument3

var shift = 1
var move = 0
var coneWidth = 18
var coneDepth = 2

switch (dir) {
	
	case 0://Right
	var neg = yy - coneWidth//LEFT
	var pos = yy + coneWidth//RIGHT
	var collisionPoint = xx + coneDepth + collisionB;
	var freeNeg = place_free( collisionPoint, neg )//LEFT
	var freePos = place_free( collisionPoint, pos )//RIGHT
	
	break;
	
	case 90://Up
	var neg = xx - coneWidth//LEFT
	var pos = xx + coneWidth//RIGHT
	var collisionPoint = yy - coneDepth - collisionB
	var freeNeg = place_free( neg, collisionPoint )
	var freePos = place_free( pos, collisionPoint )
	break;
	
	case 180://Left
	var pos = yy + coneWidth//LEFT
	var neg = yy - coneWidth//RIGHT
	var collisionPoint = xx - coneDepth - collisionB//FORWARD
	var freeNeg = place_free( collisionPoint, neg )//RIGHT
	var freePos = place_free( collisionPoint, pos )//LEFT
	break;
	
	case 270://Down
	var pos = xx + coneWidth//LEFT
	var neg = xx - coneWidth//RIGHT
	var collisionPoint = yy + coneDepth + collisionB//FORWARD
	var freeNeg = place_free( neg, collisionPoint )//RIGHT
	var freePos = place_free( pos, collisionPoint )//LEFT
	break;
	
}

if ( freeNeg && freePos ) {
	var toss = random(1)
	move = toss == 0 ? -shift: shift;
	
} else if ( freeNeg && !freePos ) {
	move = -shift
} else if ( !freeNeg && freePos ) {
	move = shift
} else if ( !freeNeg && !freePos ) {
	move = 0
}
return move