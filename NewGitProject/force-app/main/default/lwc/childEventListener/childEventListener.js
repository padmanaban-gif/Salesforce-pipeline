import { LightningElement } from 'lwc';

export default class ChildEventListener extends LightningElement {
    handleSend(){
        const newEvent = new CustomEvent('notifying',{detail:{message:'Hello parent'},
        bubbles:true,composed:true});
        this.dispatchEvent(newEvent);
    }
    
}