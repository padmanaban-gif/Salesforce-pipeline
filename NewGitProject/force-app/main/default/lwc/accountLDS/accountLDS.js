import { LightningElement,api} from 'lwc';
import Name from '@salesforce/schema/Account.Name';
import Phone from '@salesforce/schema/Account.Phone';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
//const fieldsArray=['Account.Name','Account.Phone'];
export default class AccountLDS extends LightningElement {
    @api recordId;
    @api objectApiName;
    fieldsArray=['Name','Phone'];
    handleSuccess(event){
        this.recordId=event.detail.Id;
        this.dispatchEvent(
            new ShowToastEvent({
                title:'success',
                message:'Phoen updated',
                vairant:'success'
            })
        );
    }
}