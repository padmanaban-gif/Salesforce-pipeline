trigger UpdateTotalAmountOnInvoice on Invoice_Line_Item__c (after insert,after update, after delete) {
    set<Id> invoiceIds = new set<Id>();
    
    for(Invoice_Line_Item__c lineItem : Trigger.New){
        invoiceIds.add(lineItem.Id);
    }
}