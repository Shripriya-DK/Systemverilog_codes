//-----------Example 1---------------------------
module enumerated_type;
typedef enum{init,read,write,brd,bwr}fsm_state_e;
fsm_state_e pre_state, next_state;
fsm_state_e state = state.first;
initial 
forever
begin
$display("%p : %d", state.name, state);
if(state==state.last());
break;
state= state.next();
end
endmodule

//------Example 2------------------
module enum_type();
	typedef enum {true,false} e_true_false;
		
	initial begin
	// Declare a variable of type "e_true_false" that can store TRUE or FALSE
		e_true_false answer;
		// Assign TRUE/FALSE to the enumerated variable
		answer = true;
		// Display string value of the variable
		$display("answer = %s",answer.name());
	end
endmodule*/

//---------Example Declaration types-------------------
module enum_type();

	// name : The next number will be associated with name starting from 0
// GREEN = 0, YELLOW = 1, RED = 2, BLUE = 3
	typedef enum {GREEN,YELLOW,RED,BLUE} color_set1;
	
	// name = C : Associates the constant C to name
// MAGENTA = 2, VIOLET = 7, PURPLE = 8, PINK = 9
	typedef enum {MAGENTA=2, VIOLET=7, PURPLE, PINK} color_set2;
	
	// name[N] : Generates N named constants : name0, name1, ..., nameN-1
// BLACK0 = 0, BLACK1 = 1, BLACK2 = 2, BLACK3 = 3
	typedef enum {BLACK[4]} color_set3;
	
	// name[N] = C : First named constant gets value C and subsequent ones
// are associated to consecutive values
	// RED0 = 5, RED1 = 6, RED2 = 7
	typedef enum {RED[3]=5} color_set4;
	
	// name[N:M] : First named constant will be nameN and last named
// constant nameM, where N and M are integers
// YELLOW3 = 0, YELLOW4 = 1, YELLOW5 = 2
	typedef enum {YELLOW[3:5]} color_set5;
	
	// name[N:M] = C : First named constant, nameN will get C and
// subsequent ones are associated to consecutive values until nameM
// WHITE3 = 4, WHITE4 = 5, WHITE5 = 6
	typedef enum {WHITE[3:6]=4} color_set6;
	
	initial begin
		// Create new variables for each enumeration style
		color_set1 color1;
		color_set2 color2;
		color_set3 color3;
		color_set4 color4;
		color_set5 color5;
		color_set6 color6;
		
		color1 = RED;
		color2 = MAGENTA;
		color3 = BLACK0;
		color4 = RED1;
		color5 = YELLOW4;
		color6 = WHITE4;
		
		$display("color1=%0d name=%s",color1,color1.name());
		$display("color2=%0d name=%s",color2,color2.name());
		$display("color3=%0d name=%s",color3,color3.name());
		$display("color4=%0d name=%s",color4,color4.name());
		$display("color5=%0d name=%s",color5,color5.name());
		$display("color6=%0d name=%s",color6,color6.name());
	end
endmodule
	
//--------------ENUM Methods--------------------
module enumerated_methods();
	typedef enum {GREEN,YELLOW,RED,BLUE} colors;
	
	initial begin
		colors color;
		
		color = YELLOW;
		$display("color.first()=%s",color.first());
		$display("color.last()=%s",color.last());
		$display("color.prev()=%s",color.prev());
		$display("color.next()=%s",color.next());
		$display("color.num()=%0d",color.num());
		$display("color.name()=%s",color.name());
	end
endmodule

//------------Type checking-------------------------
module enum_type_check();
	typedef enum bit[1:0] {GREEN,YELLOW,RED} e_light;
	
	e_light light;
	initial begin
		light = GREEN;	
		$display("light is %s",light.name());
		
		// Invalid because of strict typing rules
		//light = 0;
		//$display("light is %s",light.name());
		
		// explicitly casted
		light = e_light'(2);
		$display("light is %s",light.name());
	end
endmodule
	
	
