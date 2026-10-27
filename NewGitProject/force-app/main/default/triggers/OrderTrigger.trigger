trigger OrderTrigger on Order (after insert) {
    
SendOrder.initiateOrder(trigger.new);
}