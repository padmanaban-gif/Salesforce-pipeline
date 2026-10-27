import { LightningElement,api,wire } from 'lwc';
import aList from '@salesforce/apex/ConList.conListDetails';
import {getRecord} from 'lightning/uiRecordApi';

export default class AccList extends LightningElement {
    @api recordId;
    Contacts;
    error;
    @wire(getRecord,{recordId:'$recordId', fields:['Account.Name']})
    records;
   
    @wire(aList,{accId:'$recordId'})
    //contacts;property
    wiredContact(error,data){
     if(data){
        this.Contacts= data;
        this.error = undefined;
     }else if(error){
        this.Contacts = undefined;
        this.error = error;
     }
    }
    get name(){
        return this.records.data.fields.Name.value;
    }
}