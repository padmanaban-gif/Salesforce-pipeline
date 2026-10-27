import { LightningElement } from 'lwc';

export default class ChildToParentComp extends LightningElement {
    msg;

    handleData(event){
        const newMessage = event.detail.message;
        console.log('receieved message'+newMessage);
        this.msg  = newMessage;
    }

}