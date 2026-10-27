import { LightningElement } from 'lwc';

export default class ChildMessage extends LightningElement {
    handleAction(event){
        const newEvent = new CustomEvent('newaction',{
            detail:{message:'hello from child'}
        });
        this.dispatchEvent(newEvent);
    }
}