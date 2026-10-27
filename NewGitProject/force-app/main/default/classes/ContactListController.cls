public class ContactListController {
    Private string sortOrder = 'FirstName';
    
    public List<Contact> getContacts(){
        List<Contact> results = Database.query('SELECT Id,FirstName, LastName, Email '+ 'FROM Contact '+
                                              'ORDER BY '+ sortOrder +' ASC '+'limit 10');
        return results;
    }
    public void sortByLastName(){
        this.sortOrder ='LastName';
    }
    public void sortByFirstName(){
        this.sortOrder ='FirstName';
    }

}