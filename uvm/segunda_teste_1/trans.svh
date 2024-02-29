class a_tr extends uvm_sequence_item;

  int a;
  
  `uvm_object_utils_begin(a_tr)  // needed for transaction recording
  `uvm_field_int(a, UVM_ALL_ON | UVM_DEC) //needed for transaction recordign (element,propriety)
  `uvm_object_utils_end //final to object utils

endclass

