//classe deve ser herdade da classe uvm_component
class sink extends uvm_component;
   `uvm_component_utils (sink)

   // Mention type of transaction, and type of class that implements the put ()
   uvm_blocking_put_imp #(a_tr, sink) in;

   function new (string name = "sink", uvm_component parent);
      super.new (name, parent);
      // instantiate the put_export passing a reference to the instance of this sink
      in = new ("in", this);
   endfunction

   task put (a_tr tr);
      // Here, we have received the transaction from source
      `uvm_info("SINK                          ", "Transaction received", UVM_MEDIUM)
      // ` uvm_info ("SOURCE", "MENSAGEM QUE APARCE", UVM_LOW,UVM_MEDIUM,UVM_HIGH)(tested)
   endtask

endclass

