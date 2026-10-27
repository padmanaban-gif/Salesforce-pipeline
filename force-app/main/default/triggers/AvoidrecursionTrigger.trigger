trigger AvoidrecursionTrigger on Account (before insert, before update) {
    AvoidRecursion handler = new AvoidRecursion();
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            handler.beforeInsert(Trigger.New);
        }else if(Trigger.isUpdate){
            handler.beforeUpdate(Trigger.New,Trigger.OldMap);
        }
    }

}