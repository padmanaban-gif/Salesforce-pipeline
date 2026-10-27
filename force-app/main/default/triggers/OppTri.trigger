trigger OppTri on Opportunity (after insert, after update,after delete) {
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            OppTriHan.updateAnu(Trigger.new,null);
        }
    }
    if(Trigger.isUpdate){
        if(Trigger.IsAfter){
             OppTriHan.updateAnu(Trigger.new, Trigger.oldMap);
        }
    }
    if(Trigger.isDelete){
        if(Trigger.isAfter){
            OppTriHan.updateAnu(Trigger.old,null);
        }
    }
}