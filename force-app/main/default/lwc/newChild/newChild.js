import { LightningElement,wire} from 'lwc';
import{subscribe,MessageContext} from 'lightning/messageService';
import  Message_Channel from '@salesforce/messageChannel/ComponentCommunication__c';

export default class NewChild extends LightningElement {
    @wire(MessageContext)
    messageNew;
     subscription = null;
    receiveMessage='No message yet';

    connectedCallback(){
        if(!this.subscription){
            this.subscription = subscribe(this.messageNew,Message_Channel,
                (payload)=>this.handleMessage(payload));
        }
    }
    handleMessage(payload){
        console.log(payload);
        this.receiveMessage = payload.message;
    }
}