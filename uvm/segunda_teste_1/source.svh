class source extends uvm_component;
   `uvm_component_utils (source)

   // creating a put_port which will accept a "a_tr" type of data
   uvm_blocking_put_port #(a_tr) out;

   function new (string name = "source", uvm_component parent);
      super.new (name, parent);
      out = new ("out", this);
   endfunction

   task run_phase (uvm_phase phase);
      a_tr  tr;

      phase.raise_objection(this); // avoid simulation to finish immediately
				   // objeção usado para iniciar a simulaçao

      // Let us generate 5 transactions and send it via the put_port
      repeat (5) begin
         #10;  // wait some time before the transaction begins | obrigatório o uso de atrasos
      // #20 (tested)
      // #30 (tested)
         tr = new();  // create transaction instance
         `bvm_begin_tr(tr)  // start transaction recording
         `uvm_info ("SOURCE", "Sending transaction", UVM_MEDIUM)
         out.put (tr);  // send transaction to put_port
      end

      #120; // allow for some downstream processing time
   // #1 (tested)
   // #30 (tested)   
  //  #500 (tested)   
      phase.drop_objection(this);  // allow simulation to finish
   endtask
endclass

