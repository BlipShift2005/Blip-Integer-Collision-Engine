class_name BFixed extends Object

func _init()->void: 
	push_error("Do not create a BFixed object.")
	free()

func float_to_fixed(a,fracbits:int = 16)->int: return a * (1<<fracbits)

func to_float(a,fracbits:int = 16)->float: return a / float(1<<fracbits)

## return (fixed_t)((BTS64)a*(BTU64)b)>>FRACBITS;
func mul(a:int,b:int,fracbits:int = 16)->int: return (a*b)>>fracbits

## return (fixed_t)((BTS64)a<<FRACBITS)/b;
@warning_ignore("integer_division") # yeah no shit godot
func div(a:int,b:int,fracbits:int = 16)->int: return (a<<fracbits)/b

## return (fixed_t)((BTU64)a>>FRACBITS)<<FRACBITS;
func floor(a:int,fracbits:int = 16)->int: return (a>>fracbits)<<fracbits

## return FixedMul(a,FRACUNIT-t) + FixedMul(b,t);
func lerp(a:int,b:int,t:int,fracbits:int = 16)->int: return mul(a,fracbits-t,fracbits) + mul(b,t,fracbits)
