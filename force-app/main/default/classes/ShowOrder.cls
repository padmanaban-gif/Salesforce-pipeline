public with sharing class ShowOrder{
    @AuraEnabled
    public static List<Case> showOrderDetails(Date startDate, Date endDate){
        return [select Id, CreatedDate, CaseNumber, Priority
                from Case
                where CreatedDate >= :startDate AND CreatedDate <= :endDate
                ORDER BY CreatedDate DESC];
    }

}