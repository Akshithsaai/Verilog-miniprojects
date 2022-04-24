module Lock(reset,Enter,InputPass,user,Access,Setpass,Count,Alarm);
    input reset,Enter;
    input [11:0]InputPass;    //password that is given as input by user
    input [1:0]user; // user no 
    output Access,Alarm;
    output [1:0] Count;
    output reg [11:0]Setpass;
    wire [11:0]Check;

always@*
    begin
        if(user==2'b00)
        begin
            Setpass=12'hAB3;
        end
        else if(user==2'b01)
        begin
            Setpass=12'hF2A;
        end
        else if(user==2'b10)
        begin
            Setpass=12'hE93;
        end
        else if(user==2'b11)
        begin
            Setpass=12'h111;
        end
    end
    assign Check=(Setpass^InputPass); //Check will be zero if Setpass and Inoutpass are same. else it will be a non zero number.
    
    counter c1(Enter,Check,reset,Count,Access,Alarm); // Counter module that decides about access and alarm. 
endmodule
