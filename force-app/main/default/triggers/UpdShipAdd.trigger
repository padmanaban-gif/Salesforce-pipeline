trigger UpdShipAdd on Account (before insert, before update,after insert, after update) {
    /*scenario 1- updating one field avlue to another field
    if(Trigger.isBefore && Trigger.isInsert){
        for(Account acc: Trigger.new){
            if(acc.ShippingStreet == null){
                //acc.ShippingAddress = acc.BillingAddress;
                acc.ShippingCity= acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingState = acc.BillingState;
                
            }
        }
    }*/
    /* scenario 2 - showing an error if annaul revenue value is less than 10000
    if(Trigger.isBefore && trigger.isInsert){
        for(Account acc: Trigger.new){
            if(acc.AnnualRevenue < 10000){
                acc.addError('Annual revenue should be more than 1000');
            }
        }
    }
}Scenario 3 - craeting contact realted record to account record
    if(Trigger.isAfter&&Trigger.isInsert){
        List<Contact> conList = new List<Contact>();
        for(Account acc: Trigger.new){
            Contact con = new Contact();
            con.LastName = acc.Name;
            
            con.AccountId = acc.Id;
            conList.add(con);
        }
        if(conList.size()>0)
          insert conList;
    }*/
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Account acc: Trigger.new){
            Account accOld = Trigger.oldMap.get(acc.Id);
            if(acc.Name != accOld.Name){
                acc.addError('we cannot modify the account name');
            }
        }
    }
}