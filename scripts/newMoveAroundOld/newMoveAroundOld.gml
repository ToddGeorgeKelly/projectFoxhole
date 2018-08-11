




var shift = 1
var move = 0
var coneWidth = 18
var coneDepth = 2

switch (dir) {
	
	case 0://Right
	var neg = y - coneWidth//LEFT
	var pos = y + coneWidth//RIGHT
	var collisionPoint = x + coneDepth + collisionB;
	var freeNeg = place_free( collisionPoint, neg )//LEFT
	var freePos = place_free( collisionPoint, pos )//RIGHT
	
	break;
	
	case 90://Up
	var neg = x - coneWidth//LEFT
	var pos = x + coneWidth//RIGHT
	var collisionPoint = y - coneDepth - collisionB
	var freeNeg = place_free( neg, collisionPoint )
	var freePos = place_free( pos, collisionPoint )
	break;
	
	case 180://Left
	var pos = y + coneWidth//LEFT
	var neg = y - coneWidth//RIGHT
	var collisionPoint = x - coneDepth - collisionB//FORWARD
	var freeNeg = place_free( collisionPoint, neg )//RIGHT
	var freePos = place_free( collisionPoint, pos )//LEFT
	break;
	
	case 270://Down
	var pos = x + coneWidth//LEFT
	var neg = x - coneWidth//RIGHT
	var collisionPoint = y + coneDepth + collisionB//FORWARD
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