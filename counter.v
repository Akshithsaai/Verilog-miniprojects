module counter(clk,check,rstn,cnt,Access,Alarm); //Counter module
    parameter N=4; // no of users = 4
    input clk,rstn;
  input [11:0] check;
    output reg Access,Alarm;
    output reg  [1:0] cnt;
    initial begin 
    cnt=0;Access=0;Alarm=0; //initialisation of clk,access,alarm.
    end 
    always @(posedge clk or posedge rstn)
        begin    
          if(check==12'h0) begin  //If check is 0 then access is 1
            Access<=1;
            Alarm<=0;
            cnt<=0;
          end
          else if(check!=12'h0 & cnt==0) //if check is non-zero. i.e wrong attempt so increase count until count become 3
            begin
            cnt<=cnt+1;
            Access<=0;
            Alarm<=0;
            end
          else if(check!=12'h0)
            begin
            if(cnt==1)
                begin
                Alarm<=0;
                Access<=0;
                cnt<=cnt+1;
                end
            if(cnt==2)
                begin
                Alarm<=1;
                Access<=0;
                cnt<=cnt+1;
                end
            if(cnt==3)
                begin
                Alarm<=1;
                Access<=0;
                cnt<=3;
                end
            end
          if(rstn==1)
            begin
            Alarm<=0;
            cnt<=0;
            Access<=0;
            end
        end
endmodule
