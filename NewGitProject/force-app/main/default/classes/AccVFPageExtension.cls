public class AccVFPageExtension {
    Account acc =  new Account();
    public String Message{get;set;}
        
        String Param;
    public AccVFPageExtension(ApexPages.standardController stdController){
        Message ='Enter values';
        acc =(Account)stdController.getRecord();
        if(acc.Name != null){
            Message = 'welcome'+ acc.Name;
        }
        Param = ApexPages.currentPage().getParameters().get('retURL');
    }
    public PageReference customCancel(){
        PageReference ref = new pageReference('/apex/FourthVF');
        return ref;
    }
    public PageReference URLreturn(){
        if(Param == null){
            PageReference ref = new PageReference('/apex/SixthVF?retURL=/001/0');
                ref.setRedirect(true);
            return ref;
        }
        return null;
    }

}