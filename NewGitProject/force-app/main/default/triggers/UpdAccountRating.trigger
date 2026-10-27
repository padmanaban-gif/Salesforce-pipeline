trigger UpdAccountRating on Opportunity (after insert) {
   Map<Id, Account> accToUpdate = new Map<Id, Account>();
    for(Opportunity opps : trigger.new){
        if(opps.AccountId != Null){
            if(opps.Amount < 500){
                accToUpdate.put(opps.AccountId, new Account(Id = opps.AccountId, Rating ='Hot'));
            }
             else if(opps.Amount >= 500 && opps.Amount <1000){
                accToUpdate.put(opps.AccountId, new Account(Id =opps.AccountId, Rating ='Warm'));
            }
            else if(opps.Amount >= 1000){
                accToUpdate.put(opps.AccountId, new Account(Id =opps.AccountId, Rating='Cold'));
            }
            
        }
    }
    update accToUpdate.values();

    }