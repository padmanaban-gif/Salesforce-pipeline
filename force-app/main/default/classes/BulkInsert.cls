public class BulkInsert {
    public static void method(){
        //bulk insert in list by using database methods
        /*List<Contact> conList = new List<Contact>{
            new Contact(FirstName='jaya',LastName ='prakash',Department='Bank'),
            new Contact(FirstName='mani',LastName ='kandan',Department='services'),
            new Contact()
        };
            Database.SaveResult[] srList= Database.insert(conList,false);
        for(Database.SaveResult sr: srList){
            if(sr.isSuccess()){
                System.debug('contacyt successfully inserted contact Id'+sr.getId());
            }else{
                for(Database.Error er: sr.getErrors()){
                    System.debug('following errorhas been occured');
                    System.debug(er.getStatusCode()+':'+er.getMessage());
                    System.debug('error filed----'+er.getFields());
                }
            }
        }*/
        List<Contact> conList = new List<Contact>{
            new Contact(FirstName='karthi',LastName ='keyan'),
                new Contact(FirstName='Chandran',LastName='kumar'),
                new Contact()
        };
            Database.SaveResult[] srList = Database.Insert(conList,false);
        for(Database.SaveResult sr: srList){
            if(sr.isSuccess()){
                System.debug('Contact created'+sr.getId());}
            else{
                
                for(Database.Error er: sr.getErrors()){
                    
                
                System.debug(er.getStatusCode()+'---'+er.getMessage());
                System.debug('error occured filed'+er.getFields());
            }
        }
    }

    }}