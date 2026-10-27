import { LightningElement,api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class UpdateContact extends LightningElement {
    @api recordId;
     
    hendleSuccess(){
        this.dispatchEvent(new ShowToastEvent({
            title:'wohoo',
            message:'Contacts updated',
            variant:'success'
        })
    );
    }
}