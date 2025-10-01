module calc_top( input logic [9:0] SW,
					  input logic [1:0] KEY,
					  output logic [9:0] LEDR,
					  output logic [6:0] HEX5,
					  output logic [6:0] HEX4,
					  output logic [6:0] HEX3,
					  output logic [6:0] HEX2,
					  output logic [6:0] HEX1,
					  output logic [6:0] HEX0 );
					  
					  logic [3:0] A, B;
					  logic [7:0] SUM;
					  
					  assign LEDR = SW;
					  
					  always_ff @(posedge KEY[1])
						begin
						
							if (~KEY[0]) begin
								A <= 4'b0;
								B <= 4'b0;
							end
						
							else begin
						
								if (SW[9]) A <= SW [3:0];
								if (SW[8]) B <= SW [3:0];
							
							end
						end
						
						assign SUM = A + B;
						
						sevenseg hexA 			(.data(A), .segments(HEX5));
						sevenseg hexB 			(.data(B), .segments(HEX3));
						sevenseg hexSUMhigh  (.data(SUM[7:4]), .segments(HEX1));
						sevenseg hexSUMlow	(.data(SUM[3:0]), .segments(HEX0));
						
						assign HEX4 = 7'b1111111;
						assign HEX2 = 7'b1111111;
						
						
					endmodule
						
						
