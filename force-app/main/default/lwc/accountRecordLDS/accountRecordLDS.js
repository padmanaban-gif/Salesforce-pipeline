import { LightningElement,api,wire } from 'lwc';
import {getRecord} from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

const FIELDS =['Account.Name', 'Accont.Industry','Account.Phone'];

export default class AccountRecordLDS extends LightningElement {
    @api recordId;
    showEditForm = false;

    @wire(getRecord,{recordId:'$recordId',fields:FIELDS})
    account;

    handleEdit(){
        this.showEditForm=true;
    }
    handleCancel(){
        this.showEditForm = false;
    }
    handleSuccess(){
         this.showEditForm = false;
        this.dispatchEvent(new ShowToastEvent({
            title:'Success',
            message:'Account is created successfully',
            variant:'success'
        }) );
    }
}