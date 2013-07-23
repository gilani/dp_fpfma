
module lza(opA, opB, ldCount);
   `include "parameters.v"
  
  //leading digit anticipator
  localparam m=SIG_WIDTH+1;
  input [2*m+1:0] opA, opB;
  output reg [6:0] ldCount; 
  
  //Genrate, Propageate and Kill vectors
  
  wire [2*m+1:0] G,T,Z;
  
  
  
  generate 
    genvar i;
    for(i=2*m+1;i>=0;i=i-1) begin:lzd
      assign G[i]=opA[i] & opB[i];
      assign T[i]=opA[i] ^ opB[i];
      assign Z[i]=~opA[i] & ~opB[i];
    end
  endgenerate
  
  
  //Indicator vector
  wire [2*m+1:0]f;//107:0
  assign f[2*m+1]=~T[2*m+1] & T[2*m-1+1];
  generate
    genvar j;
    for(j=2*m-1+1;j>0;j=j-1)begin:indicators
      assign f[j]=(T[j+1] & ( (G[j] & ~Z[j-1]) | (Z[j] & ~G[j-1]) ) ) | 
                 (~T[j+1] & ( (Z[j] & ~Z[j-1]) | (G[j] & ~G[j-1]) ) ); 
    end
  endgenerate
  
  reg [6:0] normalizeAmt;//64-bit
  always @ (*) begin
   ldCount = normalizeAmt;
 end
 
 
 always @ (*) begin
	 casex(f)
		 //Generated code//
		 {1'b1,{107{1'bx}}}: normalizeAmt=0;
		 {2'b1,{106{1'bx}}}: normalizeAmt=1;
		 {3'b1,{105{1'bx}}}: normalizeAmt=2;
		 {4'b1,{104{1'bx}}}: normalizeAmt=3;
		 {5'b1,{103{1'bx}}}: normalizeAmt=4;
		 {6'b1,{102{1'bx}}}: normalizeAmt=5;
		 {7'b1,{101{1'bx}}}: normalizeAmt=6;
		 {8'b1,{100{1'bx}}}: normalizeAmt=7;
		 {9'b1,{99{1'bx}}}: normalizeAmt=8;
		 {10'b1,{98{1'bx}}}: normalizeAmt=9;
		 {11'b1,{97{1'bx}}}: normalizeAmt=10;
		 {12'b1,{96{1'bx}}}: normalizeAmt=11;
		 {13'b1,{95{1'bx}}}: normalizeAmt=12;
		 {14'b1,{94{1'bx}}}: normalizeAmt=13;
		 {15'b1,{93{1'bx}}}: normalizeAmt=14;
		 {16'b1,{92{1'bx}}}: normalizeAmt=15;
		 {17'b1,{91{1'bx}}}: normalizeAmt=16;
		 {18'b1,{90{1'bx}}}: normalizeAmt=17;
		 {19'b1,{89{1'bx}}}: normalizeAmt=18;
		 {20'b1,{88{1'bx}}}: normalizeAmt=19;
		 {21'b1,{87{1'bx}}}: normalizeAmt=20;
		 {22'b1,{86{1'bx}}}: normalizeAmt=21;
		 {23'b1,{85{1'bx}}}: normalizeAmt=22;
		 {24'b1,{84{1'bx}}}: normalizeAmt=23;
		 {25'b1,{83{1'bx}}}: normalizeAmt=24;
		 {26'b1,{82{1'bx}}}: normalizeAmt=25;
		 {27'b1,{81{1'bx}}}: normalizeAmt=26;
		 {28'b1,{80{1'bx}}}: normalizeAmt=27;
		 {29'b1,{79{1'bx}}}: normalizeAmt=28;
		 {30'b1,{78{1'bx}}}: normalizeAmt=29;
		 {31'b1,{77{1'bx}}}: normalizeAmt=30;
		 {32'b1,{76{1'bx}}}: normalizeAmt=31;
		 {33'b1,{75{1'bx}}}: normalizeAmt=32;
		 {34'b1,{74{1'bx}}}: normalizeAmt=33;
		 {35'b1,{73{1'bx}}}: normalizeAmt=34;
		 {36'b1,{72{1'bx}}}: normalizeAmt=35;
		 {37'b1,{71{1'bx}}}: normalizeAmt=36;
		 {38'b1,{70{1'bx}}}: normalizeAmt=37;
		 {39'b1,{69{1'bx}}}: normalizeAmt=38;
		 {40'b1,{68{1'bx}}}: normalizeAmt=39;
		 {41'b1,{67{1'bx}}}: normalizeAmt=40;
		 {42'b1,{66{1'bx}}}: normalizeAmt=41;
		 {43'b1,{65{1'bx}}}: normalizeAmt=42;
		 {44'b1,{64{1'bx}}}: normalizeAmt=43;
		 {45'b1,{63{1'bx}}}: normalizeAmt=44;
		 {46'b1,{62{1'bx}}}: normalizeAmt=45;
		 {47'b1,{61{1'bx}}}: normalizeAmt=46;
		 {48'b1,{60{1'bx}}}: normalizeAmt=47;
		 {49'b1,{59{1'bx}}}: normalizeAmt=48;
		 {50'b1,{58{1'bx}}}: normalizeAmt=49;
		 {51'b1,{57{1'bx}}}: normalizeAmt=50;
		 {52'b1,{56{1'bx}}}: normalizeAmt=51;
		 {53'b1,{55{1'bx}}}: normalizeAmt=52;
		 {54'b1,{54{1'bx}}}: normalizeAmt=53;
		 {55'b1,{53{1'bx}}}: normalizeAmt=54;
		 {56'b1,{52{1'bx}}}: normalizeAmt=55;
		 {57'b1,{51{1'bx}}}: normalizeAmt=56;
		 {58'b1,{50{1'bx}}}: normalizeAmt=57;
		 {59'b1,{49{1'bx}}}: normalizeAmt=58;
		 {60'b1,{48{1'bx}}}: normalizeAmt=59;
		 {61'b1,{47{1'bx}}}: normalizeAmt=60;
		 {62'b1,{46{1'bx}}}: normalizeAmt=61;
		 {63'b1,{45{1'bx}}}: normalizeAmt=62;
		 {64'b1,{44{1'bx}}}: normalizeAmt=63;
		 {65'b1,{43{1'bx}}}: normalizeAmt=64;
		 {66'b1,{42{1'bx}}}: normalizeAmt=65;
		 {67'b1,{41{1'bx}}}: normalizeAmt=66;
		 {68'b1,{40{1'bx}}}: normalizeAmt=67;
		 {69'b1,{39{1'bx}}}: normalizeAmt=68;
		 {70'b1,{38{1'bx}}}: normalizeAmt=69;
		 {71'b1,{37{1'bx}}}: normalizeAmt=70;
		 {72'b1,{36{1'bx}}}: normalizeAmt=71;
		 {73'b1,{35{1'bx}}}: normalizeAmt=72;
		 {74'b1,{34{1'bx}}}: normalizeAmt=73;
		 {75'b1,{33{1'bx}}}: normalizeAmt=74;
		 {76'b1,{32{1'bx}}}: normalizeAmt=75;
		 {77'b1,{31{1'bx}}}: normalizeAmt=76;
		 {78'b1,{30{1'bx}}}: normalizeAmt=77;
		 {79'b1,{29{1'bx}}}: normalizeAmt=78;
		 {80'b1,{28{1'bx}}}: normalizeAmt=79;
		 {81'b1,{27{1'bx}}}: normalizeAmt=80;
		 {82'b1,{26{1'bx}}}: normalizeAmt=81;
		 {83'b1,{25{1'bx}}}: normalizeAmt=82;
		 {84'b1,{24{1'bx}}}: normalizeAmt=83;
		 {85'b1,{23{1'bx}}}: normalizeAmt=84;
		 {86'b1,{22{1'bx}}}: normalizeAmt=85;
		 {87'b1,{21{1'bx}}}: normalizeAmt=86;
		 {88'b1,{20{1'bx}}}: normalizeAmt=87;
		 {89'b1,{19{1'bx}}}: normalizeAmt=88;
		 {90'b1,{18{1'bx}}}: normalizeAmt=89;
		 {91'b1,{17{1'bx}}}: normalizeAmt=90;
		 {92'b1,{16{1'bx}}}: normalizeAmt=91;
		 {93'b1,{15{1'bx}}}: normalizeAmt=92;
		 {94'b1,{14{1'bx}}}: normalizeAmt=93;
		 {95'b1,{13{1'bx}}}: normalizeAmt=94;
		 {96'b1,{12{1'bx}}}: normalizeAmt=95;
		 {97'b1,{11{1'bx}}}: normalizeAmt=96;
		 {98'b1,{10{1'bx}}}: normalizeAmt=97;
		 {99'b1,{9{1'bx}}}: normalizeAmt=98;
		 {100'b1,{8{1'bx}}}: normalizeAmt=99;
		 {101'b1,{7{1'bx}}}: normalizeAmt=100;
		 {102'b1,{6{1'bx}}}: normalizeAmt=101;
		 {103'b1,{5{1'bx}}}: normalizeAmt=102;
		 {104'b1,{4{1'bx}}}: normalizeAmt=103;
		 {105'b1,{3{1'bx}}}: normalizeAmt=104;
		 {106'b1,{2{1'bx}}}: normalizeAmt=105;
		 {107'b1,{1{1'bx}}}: normalizeAmt=106;
		 108'b1: normalizeAmt=107;

		 /////////////////

		 default: normalizeAmt=0;
	 endcase
 end

  
endmodule
