public class DeleteAllContacts {
    
    public void deleteCons(){
        Contact cons = [select Id from Contact];
        delete cons;
    }

}