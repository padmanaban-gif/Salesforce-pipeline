trigger AccountAddress on Account (before insert,before update,after update) {
    for(Account acc:trigger.new){
        if(acc.BillingCity == null && acc.BillingCountry==null){
            //acc.ShippingAddress = acc.BillingAddress;
            acc.BillingCity = acc.ShippingCity;
            acc.BillingCountry = acc.ShippingCountry;
        }
    }

}