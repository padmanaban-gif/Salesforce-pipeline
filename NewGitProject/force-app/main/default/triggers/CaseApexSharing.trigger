trigger CaseApexSharing on Case (after insert) {
   List<CaseShare> shareCaseRecords = new List<CaseShare>();
    //List<Case_Share__c> customShare = new List<Case_Share__C>(); apex sharing reasons for custom object
    Id userId = '005dM00000coLMj';
    for(Case cs: trigger.new){
        
        if(cs.Priority=='High' && cs.Origin=='Email' && cs.Status=='Working'){
            
            CaseShare css = new CaseShare();
           //Case_Share__c custom = new Case_Share__c(); custom object
            css.CaseId = cs.Id;
            css.userOrGroupId = userId;
            css.CaseAccessLevel = 'Edit';
            css.RowCause = Schema.CaseShare.RowCause.Manual;
            //css.RowCause =schema.Case_Share__c.RowCause.Custom_Case_Manager;custom object
            shareCaseRecords.add(css);
        }
    }
    if(!shareCaseRecords.isEmpty()){
        insert shareCaseRecords;
    }
}