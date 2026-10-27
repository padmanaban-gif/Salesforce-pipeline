import { LightningElement,api,wire } from 'lwc';
import{getRecord, getFieldValue} from 'lightning/uiRecordApi';
import name from '@salesforce/schema/Account.Name';
import phone from '@salesforce/schema/Account.Phone';

export default class CurrentAccount extends LightningElement {

    @api recordId;
    @wire(getRecord,{recordId:'$recordId',fields:[name,phone]})
    contacts;

    get(name){
        return getFieldValue(this.contacts.data,name);
    }
    get(phone){
        return getFieldValue(this.contacts.data,phone);
    }

}