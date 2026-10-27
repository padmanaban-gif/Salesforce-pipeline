import { LightningElement } from 'lwc';

export default class NewParentComp extends LightningElement {
    parentMessage;
    handleEvent(event){
        this.parentMessage = event.target.value;
    }
}