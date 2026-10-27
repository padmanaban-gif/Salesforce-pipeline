trigger AccountAnnualRevenue on Account (before insert) {
    if(trigger.isBefore && trigger.isInsert){
        for(Account acc: trigger.new){
            if(acc.AnnualRevenue < 1000){
                acc.addError('Rvenue should be more than 1000');
            }
        }
    }
}