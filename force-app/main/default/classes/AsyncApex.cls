public class AsyncApex {
    @future
    public static void updAsynApex(Set<Id> relatedRec){
        List<Lead> records = [select Id, Name, leadSource from lead where Id IN: relatedRec];
        for(Lead l : records){
            l.leadsource = 'new';
        }
        update records;
    }
/*
 * Annonymous window
 Map<Id, Lead> newRec = new Map<Id, Lead>([select Id from Lead]);
AsyncApex.updAsynApex(newRec.keyset());*/
    public static void updNew(){
        Lead newAcc = new Lead (LastName = 'jaya',Company = 'idfc', status = 'Working - Contacted');
        insert newAcc;
    }
}