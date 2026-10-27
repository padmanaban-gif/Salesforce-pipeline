import { LightningElement,api, wire } from 'lwc';
import {getRecord, getFieldValue} from 'lightning/uiRecordApi';
import Name_Field from '@salesforce/schema/Contact.Name';
import Name_Email from '@salesforce/schema/Contact.Email';

export default class ShowContactDetails extends LightningElement {

    @api recordId;

    @wire(getRecord,{recordId:'$recordId',fields:[Name_Field,Name_Email]})
    contacts;

    get name(){
        return getFieldValue(this.contacts.data, Name_Field);
    }
    get email(){
        return getFieldValue(this.contacts.data, Name_Email);
    }
}