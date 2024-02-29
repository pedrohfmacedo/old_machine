// classe que instancia uma transacao 
class a_tr extends uvm_sequence_item; 
//classe de transacao tem que ser herdeira de uvm_sequence_item
// transaction is implemented in uvm by uvm_sequence_item class

  int a; // a transaction element - only one to make things easy
/*  
  string a 	if the transaction is one strig tested) or
  bit a   	if the transaction is one bit (tested) or
  logic a 	if the a transaction is one logic (tested) or
  int[15:0];	if the a transaction is one int_extend(tested) or
  logic[2:1] 	if the a transaction is one logic (tested) or
  class a
*/


endclass

