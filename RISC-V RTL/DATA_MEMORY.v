module data_memory #( parameter DATA_WIDTH=32) 
 (
    input   wire                       clk,rst,
    input   wire   [DATA_WIDTH-1:0]    Address,
    input   wire                       WE,
    input   wire   [DATA_WIDTH-1:0]    WD,

    output  wire   [DATA_WIDTH-1:0]    RD 
);

reg [DATA_WIDTH-1:0] data_mem [0 : 105];
integer i;

always @( posedge clk or negedge rst)
   begin
     if(!rst)
       begin
        for(i=0;i<106 ; i=i+1)
        begin
        data_mem[i]<= 'b0;
        end
       end

    else if (WE)
      begin
        data_mem[Address] <= WD; 
      end   
   end

    assign RD = data_mem[Address];       
endmodule