import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class ParentEventListener extends LightningElement {
    handleNotifiaction(event){
        const message = event.detail.message;
        this.dispatchEvent(new ShowToastEvent({
            title:'Success',
            message:message,
            variant:'info'
        }))
    }
}