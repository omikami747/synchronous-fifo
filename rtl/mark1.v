module mk1(
	   din,
	   w_en,
	   r_en,
	   dout,
	   clk,
	   rst
	   );
   input  [7:0]    din  ;
   input 	   r_en ;
   input 	   w_en ;
   input 	   clk  ;
   input 	   rst  ;
   output [7:0]    dout ;

   reg [7:0] 	   mem [7:0];
   reg [2:0] 	   r_ptr    ;
   reg [2:0] 	   w_ptr    ;
   reg 		   w_vld    ;

   reg [7:0] 	   fdin     ;
   reg             fr_en    ;
   reg 		   fw_en    ;
 
//////////////////////////////////////////////////////////////////////
//    flopping in  
//
//////////////////////////////////////////////////////////////////////

   always @(posedge clk or negedge rst)
     begin
	fdin  <= din        ;
	fr_en <= r_en       ;
	fw_en <= w_en       ;
     end
//////////////////////////////////////////////////////////////////////
// main logic
//
//////////////////////////////////////////////////////////////////////  	  
   always @(posedge clk or negedge rst)
     
     begin
	if (rst === 1'b0)           //reset case 
	  begin
	     r_ptr <= 1'b0         ;
	     w_vld <= 0            ; 
	     w_ptr <= 1'b0         ;
	     dout  <= 7'bXXXXXXXX  ;
	  end
	else
	  //   read is enabled
	  if (r_en === 1'b1)        // if read enable
	    begin
	       if(r_ptr === 1'b0)   // if fifo is empty 
		 begin
		 end
	       else                 // if fifo is not empty
		 begin
		 end
	    end
	  else
	    // write is enabled
	  if (w_en === 1'b1)
	    begin
	       if(w_ptr == 3'b111)  // if fifo is full 
		 begin
		 end
	       else                 // if fifo is not full 
		 begin
		 end
	    end
	
	
	       
   
endmodule // mk1
