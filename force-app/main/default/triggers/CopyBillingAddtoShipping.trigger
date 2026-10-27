trigger CopyBillingAddtoShipping on Account (before insert) {
    
    for(Account acc: trigger.new){
        if(acc.CopyBillingToShipping__c){
            //acc.ShippingAddress = acc.BillingAddress;
            acc.ShippingCity = acc.BillingCity;
            acc.ShippingCountry = acc.BillingCountry;
            
        }
    }

}