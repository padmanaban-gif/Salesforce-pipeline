import { LightningElement,api} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import {NavigationMixin} from 'lightning/Navigation';

export default class UpdateAccountUsingLDS extends LightningElement {
@api recordId;
handleSubmit(event){
    event.preventDefault();
    const feilds = event.detail.fields;

    if(!feilds.Phone || feilds.Phone.length <10){
        this.dispatchEvent(new ShowToastEvent({
            title:"Error",
            message:'Phone number should 10 didguts at least',
            variant:'error'
        }));
        return;
    }
    this.template.querySelector('lightning-record-edit-form').submit(fields);
}
handleSuccess(event){
    this.dispatchEvent(new ShowToastEvent({
        title:'Success',
        message:'Account upated',
        variant:'success'
    }));
    this[NavigationMixin.Navigate]({
        type:'standard__recordPage',
       attributes: {
           recordId:event.detail.Id,
           objectApiName:'Account',
           actionName:'view'

        }
    });
}
handleError(event){
    this.dispatchEvent(new ShowToastEvent({
        title:'Error',
        message:'Error while saving record'+JSON.strigify(event.detail),
        variant:'error'
    }));
}
}