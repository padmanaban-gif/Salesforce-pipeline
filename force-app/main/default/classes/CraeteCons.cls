public class CraeteCons {
    public static void craeteContacts(){
        List<Contact> contactsToInsert = new List<Contact>();
        for(Integer i =1; i<=5; i++){
            Contact con = new Contact();
            con.LastName = 'mani'+i;
            con.email = 'Padmanabanpr865@gmail.com';
            contactsToInsert.add(con);
        }
        Database.DMLOptions dml = new Database.DMLOptions();
        dml.DuplicateRuleHeader.allowSave = true;

        Database.insert(contactsToInsert, dml);
    }

}