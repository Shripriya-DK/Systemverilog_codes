//----------------EXAMPLE 1-----------------------------
module fork_join_none1();
	task automatic print;
		input [4:0] value;
		input [4:0] delay;
		begin
			#(delay) $display("@%g value passed %d delay %d",$time,value,delay);
		end
	endtask
	
	initial begin
		fork
			#1 print(10,7);
			#1 print(8,5);
			#1 print(4,2);
		join_none
		$display("@%g came out of fork-join",$time);
		#20 $finish;
	end
endmodule

//----------------EXAMPLE 2 Nested fork-join_any-----------------------------
module fork_join_none2();
	initial begin
		$display("[%0t] Main thread: fork-join start",$time);
		fork
			fork
				print(20,"Thread1_0");
				print(30,"Thread1_1");
			join_none
			print(10,"Thread2_0");
		join_any
		$display("[%0t] Main thread:fork-join finish",$time);
	end
	
	task automatic print(int delay,string thread);
		#(delay) $display("[%0t] %s",$time,thread);
	endtask
endmodule
