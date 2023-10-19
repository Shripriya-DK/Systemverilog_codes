module test();
	initial
	begin
	#10;
		fork
			begin
			#20;
			$display($time,"Thread1");
			end
			begin
			#30;
			$display($time,"Thread2");
			end
		join
	$display("outside thread");
	end
endmodule
