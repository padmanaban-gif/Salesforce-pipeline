/*trigger AccountTrigger on Account (before insert) {
TriggerHandler.Handling(Trigger.New);//caling the method from TriggerHandler class.
}*/
trigger AccountTrigger on Account (before insert,after insert,before Update,after update,before delete){
    if(Trigger.isDelete){
        if(Trigger.isBefore){
            TriggerHandler.showError(Trigger.old);
        }
    }
    /*if(Trigger.isInsert){
        if(Trigger.isBefore){
           TriggerHandler.UpdateAcc(Trigger.new);
        }else if(Trigger.isAfter){
            //TriggerHandler.CreateRelOpp(Trigger.New);
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.isBefore){
            TriggerHandler.UpdateDes(Trigger.new, Trigger.oldMap);
        }else if(Trigger.isAfter){
            TriggerHandler.UpdateRelOpp(Trigger.new, Trigger.oldMap);
        }
}*/ }