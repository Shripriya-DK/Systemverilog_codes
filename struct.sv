// Structures -> a collection of variables of different data types

----------Example 1-----------------------
typedef struct {
  logic [7:0] a;
  logic [7:0] b;
} my_struct;

module test;

  initial begin
    my_struct s;
    my_struct* p;

    // Assign values to structure fields
    s.a = 8'b00111111;
    s.b = 8'b11000000;

    // Assign structure pointer
    p = &s;

    // Bitwise AND operation
    $display("s.a & s.b = %b", s.a & s.b);

    // Logical AND operation
    $display("s.a && s.b = %b", s.a && s.b);

    // Bitwise AND operation using structure pointer
    $display("p->a & p->b = %b", p->a & p->b);

    // Logical AND operation using structure pointer
    $display("p->a && p->b = %b", p->a && p->b);
  end
endmodule

//------------Unpacked struct---------------------
module unpacked_struct();
	typedef struct{
			string fruit;
			int count;
			byte expiry;} st_fruit;
			
	initial begin
		st_fruit fruit1,fruit2;
		fruit1 = {"apple",14,10};
		$display("st_fruit = %p",fruit1);
		fruit2 = {"mango",11,12};
		$display("st_fruit = %p",fruit2);
		fruit1 = fruit2;
		fruit1.fruit = "orange";
		$display("st_fruit = %p",fruit1);
		$display("st_fruit = %p",fruit2);
	end
endmodule*/

//-----------Packed struct---------------------
// Create a "packed" structure data type which is similar to creating
// bit [7:0] ctrl_reg;
// ctrl_reg [0] represents en
// ctrl_reg [3:1] represents cfg
// ctrl_reg [7:4] represents mode

typedef struct packed{
		bit [3:0] mode;
		bit [2:0] cfg;
		bit en;} st_ctrl;

module packed_struct();
	st_ctrl ctrl_reg;
	
	initial begin
		ctrl_reg = '{4'ha,3'h5,1};
		$display("ctrl_reg = %p",ctrl_reg);
		
		// Change packed structure member to something else
	#1	ctrl_reg.mode = 4'h3;
		$display("ctrl_reg = %p",ctrl_reg);
	
	// Assign a packed value to the structure variable
	#1 ctrl_reg = 8'hff;
		$display("ctrl_reg = %p",ctrl_reg);
	end
endmodule

