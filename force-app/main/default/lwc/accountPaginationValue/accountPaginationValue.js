import { LightningElement, track} from 'lwc';
import getAccounts from '@salesforce/apex/AccountPagination.getPaginatedResult';

export default class AccountPaginationValue extends LightningElement {

    @track accounts =[];
    @track pagerNumber = 1;
    @track pageSize = 5;
    totalRecords =0;
    totalPages = 0;

    connectedCallback(){
        this.loadAccounts();
    }
    loadAccounts(){
        getAccounts({pageNumber:this.pageNumber, pageSize:this.pageSize})
        .then(results=>{
            this.accounts = results.accounts;
            this.totalRecords = results.totalRecords;
            this.totalPages = Match.Ceil(this.totalRecords/this.pageSize);
        })

        .catch(error=>{
            console.error(error);
        });
    }
    handlePrevious(){
        if(this.pageNumber > 1){
           this.pageNumber--;
           this.loadAccounts(); 
        }
    }
    handleNext(){
        if(this.pageNumber < this. totalPages){
            this.pageNumber++;
            this.loadAccounts();
        }
    }
}