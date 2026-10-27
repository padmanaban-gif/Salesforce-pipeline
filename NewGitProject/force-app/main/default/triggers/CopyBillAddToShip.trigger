trigger CopyBillAddToShip on Account (before insert,before update) {
    
    for(Account acc: trigger.new){
        if(acc.BillingCity != Null){
            acc.shippingCity = acc.BillingCity;
        }
    }

}