trigger PrevConCreationDupLastName on Contact (before insert) {
    set<String> nameList = new set<String>();
    set<String> leadList = new set<String>();
    for(Contact con: trigger.new){
        if(con.LastName != null && con.LeadSource != Null){
            nameList.add(con.LastName);
            leadList.add(con.LeadSource);
        }
    }
    Map<String, Contact> existingCons = new Map<String, Contact>();
    for(Contact con:[select Id, LastName, LeadSource from Contact where LastName IN :nameList AND LeadSource IN : leadList]){
        existingCons.put(con.LastName +'-'+con.LeadSource, con);
    }

}