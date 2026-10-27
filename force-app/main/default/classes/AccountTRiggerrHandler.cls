public class AccountTRiggerrHandler {
    public static void copyBillingToShipping(List<Account> accList){
        for(Account acc: accList){
            if(acc.CopyBillingToShipping__c){
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingStreet= acc.BillingStreet;
                acc.ShippingState = acc.BillingState;
                acc.ShippingPostalCode = acc.BillingPostalCode;
            }
        }
    }
}