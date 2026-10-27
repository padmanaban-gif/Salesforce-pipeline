import { LightningElement,wire } from 'lwc';
import{publish, MessageContext} from 'lightning/messageService';
import Message_Channel from '@salesforce/messageChannel/ComponentCommunication__c';

export default class NewParent extends LightningElement {
    @wire(MessageContext)
    messageNew;

    handleSend(event){
        const inpMsg = this.template.querySelector('lightning-input').value;
        const payload = {message:inpMsg};
        publish(this.messageNew,Message_Channel,payload);
    }

}