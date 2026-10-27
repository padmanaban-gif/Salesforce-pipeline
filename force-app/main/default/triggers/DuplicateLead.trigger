trigger DuplicateLead on Lead (before insert, before update) {
    Set<String> emailList = new Set<String>();
    for(Lead l : trigger.new){
        if(String.isNotBlank(l.Email)){
            emailList.add(l.Email.trim().toLowerCase());
        }
    }
    Map<String,Contact> existingCons = new Map<String, Contact>();
    for(Contact c: [select Id, Name, Email from Contact where Email IN :emailList]){
        if(String.isNotBlank(c.Email)){
            existingCons.put(c.Email.trim().toLowerCase(),c);
        }
    }
    
    for(Lead l: trigger.new){
        String newEmail = l.Email.trim().toLowerCase();
        if(existingCons.containsKey(newEmail)){
            l.Email.addError('Already there is an contact with same Email'+l.Email);
        }
    }

}