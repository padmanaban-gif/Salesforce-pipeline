trigger CopyBillingAdToShi on Account (before insert) {
    for(Account acc: trigger.new){
        if(acc.CopyBillingToShipping__c){
            acc.ShippingCity = acc.BillingCity;
            acc.ShippingCountry = acc.BillingCountry;
        }
    }
}