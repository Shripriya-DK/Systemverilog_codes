//----------EXAMPLE 1-------------------------
module test();
	initial
	begin
		#10;
			fork
				begin
				#20;
				$display("@%0t Thread1",$time);
				end
				begin
				#30;
				$display("@%0t Thread2",$time);
				end
			join
		$display("outside thread");
	end
endmodule

//----------EXAMPLE 2-------------------------
module tb;
	initial begin
		$display("[%0t] Main thread:Fork join going to start",$time);
		fork
			#30 $display("[%0t] Thread1 finished",$time);
			
			begin
				#5 $display("[%0t] Thread2 start",$time);
				#10 $display("[%0t] Thread2 finished",$time);
			end
			
			#20 $display("[%0t] Thread3 finished",$time);
		join
	$display("%0t Main Thread: Fork join finished",$time);
	end
endmodule

//----------EXAMPLE 3 Nested fork join-------------------------
module tb;
	initial begin
		$display("[%0t] Main thread:Fork join going to start",$time);
		fork
			fork
				print(20,"Thread1_0");
				print(30,"Thread1_1");
			join
			print(10,"Thread2");
		join
		$display("[%0t] Main thread:Fork join has finished",$time);
	end
		
		task automatic print(int _time, string thread);
			#(_time) $display("[%0t] %s",$time,thread);
		endtask
endmodule

//----------EXAMPLE 3 Nested fork join-------------------------
module tb;
	initial begin
		$display("[%0t] Main thread:Fork join going to start",$time);
			fork
				//Thread 1
				fork
					#50 $display("[%0t] Thread1_0 ...",$time);
					#70 $display("[%0t] Thread1_1 ...",$time);
					begin
						#10 $display("[%0t] Thread1_2 ...",$time);
						#100 $display("[%0t] Thread1_2 finished",$time);
					end
				join
				//Thread 2
				begin
					#5 $display("[%0t] Thread2 ...",$time);
					#10 $display("[%0t] Thread2 finished",$time);
				end
				//Thread 3
				#20 $display("[%0t] Thread3 finished ...",$time);
			join
		$display("[%0t] Main thread:Fork join has finished",$time);
	end
endmodule

//-------------EXAMPLE 4-------------------------------------	
module fork_join_all();
	
	task automatic print;
		input [7:0] value;
		input [7:0] delay;
		begin
			#(delay) $display("@%g passed value %d delay %d",$time,value,delay);
		end
	endtask
	
	initial begin
		fork
			#1 print(10,7);
			#1 print(8,5);
			#1 print(4,2);
		join
		$display("@%g came out of fork-join",$time);
		#20 $finish;
	end
endmodule
