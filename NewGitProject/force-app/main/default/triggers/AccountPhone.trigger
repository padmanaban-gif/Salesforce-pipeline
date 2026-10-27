trigger AccountPhone on Account (before insert) {
    for(Account acc:trigger.new){
        if(acc.Phone==null){
           acc.addError('Phone field is mandatory');
        }
    }

}