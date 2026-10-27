import { LightningElement,wire } from 'lwc';
import accRecords from '@salesforce/apex/ShowAccount.showAccountRecord';
import{NavigationMixin} from'lightning/Navigation';
export default class ShowAccountComponent extends NavigationMixin(LightningElement) {
    accounts;
    searchTerm='';

    @wire(accRecords,{searchTerm:'$searchTerm'})
    wiredAccounts({data,error}){
        if(data){
            this.accounts = data;
        } else if(error){
            console.error(error);
        }
    }
    handleChange(event){
        this.searchTerm = event.target.value;
    }
    hendleNav(event){
        const accountId = event.target.dataset.Id;    
        this[NavigationMixin.Navigate]({
            type:'standard__recordPage',
            attributes:{
                recordId:accountId,
                objectApiName:'Account',
                actionName:'view'
            }
        });
    }
   


}