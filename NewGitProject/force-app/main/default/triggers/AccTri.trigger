trigger AccTri on Account (after insert,after update) {
   /*if(Trigger.isDelete){
        if(Trigger.isBefore){
            accTriHan.showErr(Trigger.old);
        }
    }
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            accTriHan.showError(Trigger.new);
        }
    }
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            accTriHan.createRelOpp(Trigger.new);
        }
    }*/
    if(Trigger.isAfter){//prevent recursion 
        if(Trigger.isUpdate){
            if(!preventRecursion.firstCall){
                preventRecursion.firstCall = true;
                accTriHan.updAcc(Trigger.new, Trigger.oldMap);
            }
        
        }}
}