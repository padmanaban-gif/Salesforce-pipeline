import { LightningElement,wire,track } from 'lwc';
import getAccounts from '@salesforce/apex/NewAccountController.getAccount';

export default class DynamicDatatable extends LightningElement {
    column=[
        { label :'Account Name', fieldName:'Name'},
        {label:'Account Industry', fieldName:'Industry'},
        {lebel:'Account Phone', fieldName:'Phone'}
    ];
    @track tableData=[];
    @track isLoading = false;

    @wire(getAccounts)
    wiredAccounts({data, error}){
        if(data){
            this.tableData = data;
        }else if(error){
            console.error('No records Found',error);
        }
    }

    
}