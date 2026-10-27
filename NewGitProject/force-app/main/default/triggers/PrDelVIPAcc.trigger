trigger PrDelVIPAcc on Account (before delete) {
    
    set<Id> accIds = new set<id>();
    for(Account acc: trigger.old){
        
        if(acc.Industry =='Banking'){
            acc.addError('You cant delete banking accounts');
        }
        }
    

}