trigger AllowOnlyOnePrimConOnAccount on Contact (before insert, before update) {

    Set<Id> accIds = new Set<Id>();

    // Collect Account Ids for contacts marked as Primary
    for(Contact con : Trigger.new){
        if(con.Primary__c && con.AccountId != null){
            accIds.add(con.AccountId);
        }
    }

    // Map<AccountId, Primary Contact>
    Map<Id, Contact> primaryCons = new Map<Id, Contact>();

    for(Contact con : [
        SELECT Id, AccountId
        FROM Contact
        WHERE AccountId IN :accIds
        AND Primary__c = true
    ]){
        primaryCons.put(con.AccountId, con);
    }

    // Validate
    for(Contact con : Trigger.new){
        if(con.Primary__c && con.AccountId != null){

            Contact existingPrimary = primaryCons.get(con.AccountId);

            // Ignore the same contact during update
            if(existingPrimary != null && existingPrimary.Id != con.Id){
                con.addError('Primary contact already exists for this Account.');
            }
        }
    }
}