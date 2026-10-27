//Write an apex Trigger to Create a Number of Records based onEntered values in the Number of Location field in the Account
//object.
trigger NewNoOfLoc on Account (after insert,after update) {
    
    List<Opportunity> oppLists = new List<Opportunity>();
    for(Account acc: trigger.New){
    if(trigger.isAfter && trigger.isInsert){
        
            if(acc.NumberofLocations__c != Null && acc.NumberofLocations__c > 0){
                for(Integer i =0; i<acc.NumberofLocations__c;i++){
                    Opportunity oppList = new Opportunity();
                    oppList.Name = acc.Name+i;
                    oppList.StageName = 'Prospecting';
                    oppList.CloseDate = Date.Today();
                    oppList.Max_Amount__c =500;
                    oppList.AccountId = acc.Id;
                    oppLists.add(oppList);
                }
            }
        }
        if(trigger.isAfter && trigger.isUpdate){
        Account oldAcc = trigger.oldMap.get(acc.Id);
            if(acc.NumberofLocations__c != NULL && acc.NumberofLocations__c != oldAcc.NumberofLocations__c ){
                Integer oldAccs = Integer.valueOf(acc.NumberofLocations__c);
                for(Integer i =0;i<oldAccs;i++){
                     Opportunity oppList = new Opportunity();
                    oppList.Name = acc.Name+i;
                    oppList.StageName = 'Prospecting';
                    oppList.CloseDate = Date.Today();
                    oppList.Max_Amount__c =500;
                    oppList.AccountId = acc.Id;
                    oppLists.add(oppList);
                }
                
            }
        
    }
    
    }
    insert oppLists;

    }