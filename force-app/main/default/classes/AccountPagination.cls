public with sharing class AccountPagination{
    @AuraEnabled(cacheable = true)
    public static PaginatedResult getPaginatedResult(Integer pageNumber, Integer pageSize){
        Integer offset = (pageNumber - 1) * pageSize;
        List<Account> accounts = [select Id, Name
                                  from Account
                                  limit :pageSize
                                  OFFSET :offset];
        Integer totalRecords = [select Count()
                                from Account ];
        return new PaginatedResult(accounts, totalRecords);
    }

    public class PaginatedResult{
        @AuraEnabled
        public List<Account> accounts;
        @AuraEnabled
        public Integer totalRecords;
        public PaginatedResult(List<Account> accounts, Integer totalRecords){
            this.accounts = accounts;
            this.totalRecords = totalRecords;
        }

    }

}