module universal_bcd_decoder (
	RBI, BI, LT, AL,
	V0, V1, V2,
	X6, X7, X9,
	A, B, C, D,
	RBO,
	Qa, Qb, Qc, Qd, Qe, Qf, Qg
);

	input RBI, BI, LT, AL;
	input V0, V1, V2;
	input X6, X7, X9;
	input A, B, C, D;
	output RBO;
	output Qa, Qb, Qc, Qd, Qe, Qf, Qg;

	wire [2:0] version;
	wire [3:0] value;
	assign version = {V2, V1, V0};
	assign value = {D, C, B, A};

	reg [6:0] data;
	assign RBO = ((value != 0) | RBI | ~LT) & BI;
	assign Qa = ((data[0] | ~LT) & BI) ^ ~AL;
	assign Qb = ((data[1] | ~LT) & BI) ^ ~AL;
	assign Qc = ((data[2] | ~LT) & BI) ^ ~AL;
	assign Qd = ((data[3] | ~LT) & BI) ^ ~AL;
	assign Qe = ((data[4] | ~LT) & BI) ^ ~AL;
	assign Qf = ((data[5] | ~LT) & BI) ^ ~AL;
	assign Qg = ((data[6] | ~LT) & BI) ^ ~AL;

	always @(version or value) begin
		if (value < 10) begin
			case (value)
				0: data = (RBI ? 7'h3F : 7'h00);
				1: data = 7'h06;
				2: data = 7'h5B;
				3: data = 7'h4F;
				4: data = 7'h66;
				5: data = 7'h6D;
				6: data = (X6 ? 7'h7D : 7'h7C);
				7: data = (X7 ? 7'h27 : 7'h07);
				8: data = 7'h7F;
				9: data = (X9 ? 7'h6F : 7'h67);
			endcase
		end else begin
			case (version)
				// RCA / blanking version
				0: data = 7'h00;

				// TI version
				1: case (value)
					10: data = 7'h58;
					11: data = 7'h4C;
					12: data = 7'h62;
					13: data = 7'h69;
					14: data = 7'h78;
					15: data = 7'h00;
				endcase

				// NatSemi version
				2: case (value)
					10: data = 7'h5C;
					11: data = 7'h63;
					12: data = 7'h01;
					13: data = 7'h40;
					14: data = 7'h08;
					15: data = 7'h00;
				endcase

				// Toshiba version
				3: case (value)
					10: data = 7'h3F;
					11: data = 7'h06;
					12: data = 7'h5B;
					13: data = 7'h4F;
					14: data = 7'h66;
					15: data = 7'h6D;
				endcase

				// lines version
				4: case (value)
					10: data = 7'h08;
					11: data = 7'h48;
					12: data = 7'h49;
					13: data = 7'h41;
					14: data = 7'h01;
					15: data = 7'h00;
				endcase

				// Electronika version
				5: case (value)
					10: data = 7'h40;
					11: data = 7'h38;
					12: data = 7'h39;
					13: data = 7'h31;
					14: data = 7'h79;
					15: data = 7'h00;
				endcase

				// Code B version
				6: case (value)
					10: data = 7'h40;
					11: data = 7'h79;
					12: data = 7'h76;
					13: data = 7'h38;
					14: data = 7'h73;
					15: data = 7'h00;
				endcase

				// hexadecimal version
				7: case (value)
					10: data = 7'h77;
					11: data = 7'h7C;
					12: data = 7'h39;
					13: data = 7'h5E;
					14: data = 7'h79;
					15: data = 7'h71;
				endcase
			endcase
		end
	end

endmodule
