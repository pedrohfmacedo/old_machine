// A classe source, deve ser herdade da uvm_componente e aplicada 
class source extends uvm_component;
   `uvm_component_utils (source)
   // creating a put_port which will accept a "a_tr" type of data
   uvm_blocking_put_port #(a_tr) out;

   function new (string name = "source", uvm_component parent);
      super.new (name, parent);
      out = new ("out", this); //criação de um apontador
   endfunction

   task run_phase (uvm_phase phase);
      a_tr  tr;
      // generate 5 transactions and send it via the put_port
      // generate 1, 10 and 100 transactons (tested)
      repeat (5) begin
         tr = new();  // create transaction instance
         `uvm_info ("SOURCE", "Sending transaction", UVM_MEDIUM)
	// ` uvm_info ("SOURCE", "MENSAGEM QUE APARCE", UVM_GRAU_DE_IMPORTANCIA)
	// ` uvm_info ("SOURCE", "MENSAGEM QUE APARCE", UVM_LOW,UVM_MEDIUM,UVM_HIGH)(tested)
	// ` uvm_info ("OUTRAS OBJETOS", "MENSAGEM DIVERSAS", UVM_)(tested)
         out.put (tr);  // send transaction to put_port
      end
   endtask
endclass

