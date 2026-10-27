import { LightningElement } from 'lwc';

export default class ParentMessage extends LightningElement {
    //childMessage;
    msg;
    handleAction(event) {

        const childMessage = event.detail.message;
        console.log('message from child:', childMessage);
        this.msg = childMessage;
    }
}