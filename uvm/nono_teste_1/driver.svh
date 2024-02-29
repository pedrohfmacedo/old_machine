class driver_master extends uvm_driver #(a_tr);
  `uvm_component_utils(driver_master)

   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction

   task run_phase(uvm_phase phase);

      forever begin
          a_tr tr_sequencer; // transaction coming from sequencer
          a_tr tr_refmod; // transaction going to reference model  
         
          seq_item_port.get_next_item(tr_sequencer); // get transaction

          $cast(tr_refmod, tr_sequencer.clone()); // copy transaction
          `bvm_begin_tr(tr_refmod)
          rsp_port.write(tr_refmod); // send it to reference model

          #30;
          seq_item_port.item_done(); // notify sequencer that transaction is completed
        end
   endtask

endclass

