import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import name from '@salesforce/schema/Contact.LastName';
import phone from '@salesforce/schema/Contact.Email';

export default class SubmitContactFormLDS extends LightningElement {
fields =[name,phone];

handleSubmit(event){
    event.preventDefault();
    const fields = event.detail.fields;
    this.template.querySelector('lightning-record-form').submit(fields);
}
handleSuccess(event){
    this.dispatchEvent(new ShowToastEvent({
        title:"Success",
        message:'Conatct created',
        variant:'success'
    }))
}
     
}