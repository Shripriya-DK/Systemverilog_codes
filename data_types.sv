module logic_test(inout y);
logic a_in, b_in;
assign a_in = 'b0;
assign b_in = 'b1;

initial
begin
a_in=10;
end
endmodule
module top;
logic c_out;
logic_test lt(c_out);
endmodule: top*/

How to write floating point and exponential numbers
module tb;
	real pi;
	real freq;
	
	initial
	begin	
		pi = 3.14;
		freq = 1e6;
		$display("value of pi = %f",pi);
		$display("value of pi = %0.3f",pi);
		$display("value of pi = %3f",pi);
		$display("value of freq = %f",freq);
		$display("value of freq = %0d",freq);
	end
endmodule

output
# value of pi = 3.140000
# value of pi = 3.140
# value of pi = 3.140000
# value of freq = 1000000.000000
# value of freq = 1000000


// Systemverilog strings
	declaration and printing 
		module tb;
			string message = "string";
			initial begin
			$display("%s",message);
			//iterating through string variable to identify idividual characters and print 
			foreach(message[i])
				$display("%s",message[i]);
			end
		endmodule
# string
# s
# t
# r
# i
# n
# g*/

	string opertaors
	module tb;
		string first = "System";
		string last = "Verilog";
		
		initial begin
		//String equality
		if(first == last)
			$display("first=%s is EQUAL to last=%s",first,last);
		
		if(first != last)
			$display("first=%s is NOT EQUAL to last=%s",first,last);
		
		// > or < compares the length of both strings
		if(first > last)
			$display("first=%s is GREATER than last=%s",first,last);
		
		if(first < last)
			$display("first=%s is SMALLER than last=%s",first,last);
			
		//string concatenation
			$display("Language = %s",{first,last});
		
		//string replication
			$display("%s",{3{first}});
		
		//string indexing 
			$display("first[2]=%s last[1]=%s",first[2],last[1]);
		end	
endmodule

# first=System is NOT EQUAL to last=Verilog
# first=System is SMALLER than last=Verilog
# Language = SystemVerilog
# SystemSystemSystem
# first[2]=s last[1]=e

	string methods
	module tb;
		string message = "system verilog";
		
		initial begin
		string message1;
		string message2;
		// length of string
		$display("len of string =%0d",message.len());
		
		//putc 
		message1 = message;
		message1.putc(3,"s");
		$display("put character = %s",message1);
		
		//getc
		$display("get character(2) = %s",message.getc(2));
		
		//covert to upper case
		$display("Upper case = %s",message.toupper());
		
		//comparison of strings
		
		message2 = "verilog";
		$display("compare message to message1 = %0d",message.compare(message2));
		
		//sub string
		$display("substring = %s",message.substr(0,5));
		end
	endmodule
	
--------------BIT DATA TYPE------------------------
module tb;
	bit var_a;
	bit[3:0] var_b;
	logic [3:0] x_val;
	
	initial begin
	// Initial value of "bit" data type is 0
	$display("Initial value var_a = %0b var_b=0x%h",var_a,var_b);
	
	// Assign new values and display the variable to see that it gets the new values
	var_a = 1;
	var_b = 4'hF;
	$display("New values of var_a=%b var_b=0x%h",var_a,var_b);
	
	//If a "bit" type variable is assigned with a value greater than it can hold
//the left most bits are truncated. In this case, var_b can hold only 4 bits
 //and hence 'h481 gets truncated leaving var_b with only 'ha;

	var_b = 16'h481a;
	$display("Truncated value: var_b=0x%h",var_b);
	
	//If a logic type or any 4-state variable assigns its value to a "bit" type
 variable, then X and Z get converted to zero
 
	var_b = 4'b0x1z;
	$display("var_b = %b",var_b);
	end
endmodule*/

-------------INTEGER TYPE------------------------
module int_type();
	// By default int data types are signed which means
// that MSB is the sign bit and the integer variables can
// also store negative numbers
	shortint s_var;
	int i_var;
	longint l_var;
	
	//The $bits system task returns the number of bits in a variable. Note that var_a, var_b and var_c
	//roll over to the negative side.
	initial begin
		$display("Sizes s_var=%0d, i_var=%0d, l_var=%0d",$bits(s_var),$bits(i_var),$bits(l_var));
		
	// Assign the maximum value for each of the variables
// MSB of each variable represents the sign bit and is set to 0
// Rest of the bit positions are filled with 1 and hence you
// get the maximum value that these variables can hold
	
	#1 	s_var = 'h7FFF;
		i_var = 'h7FFF_FFFF;
		l_var = 'h7FFF_FFFF_FFFF_FFFF;
		
	// When added a 1, the sign changes to negative because this is a signed variable
	#1 s_var += 1;
	   i_var += 1;
	   l_var += 1;
	end
	
	initial begin
		$monitor("s_var = %0d, i_var = %0d, l_var = %0d",s_var,i_var,l_var);
	end
endmodule
	
// Now we will make the integers declared in above snippet as unsigned 
module int_type();		
	shortint unsigned s_var;
	int unsigned i_var;
	longint unsigned l_var;
	
	initial begin
		$display("Sizes s_var=%0d, i_var=%0d, l_var=%0d",$bits(s_var),$bits(i_var),$bits(l_var));
		
	#1 	s_var = 'hFFFF;
		i_var = 'hFFFF_FFFF;
		l_var = 'hFFFF_FFFF_FFFF_FFFF;
		
	#1 s_var += 1;
	   i_var += 1;
	   l_var += 1;	   
	end
	
	initial begin
		$monitor("s_var = %0d, i_var = %0d, l_var = %0d",s_var,i_var,l_var);
	end
endmodule*/

//------------------------BYTE TYPE------------------------		
module byte_type();	
	byte s_byte;
	byte unsigned u_byte;
	
	initial begin
		$display("Size s_byte=%0d, u_byte=%0d",$bits(s_byte),$bits(u_byte));
	
	#1 s_byte = 'h7F;
		u_byte = 'h7F;
	
	#1 s_byte += 1;
		u_byte += 1;
		
	#1 u_byte = 'hFF;
	
	#1 u_byte += 1;
	end
	
	initial begin
		$monitor("s_byte = %0d, u_byte=%0d",s_byte,u_byte);
	end
endmodule
	
