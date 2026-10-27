import { LightningElement,api } from 'lwc';

export default class ChildToParent extends LightningElement {
   handleSend(){
    const newEvent = new CustomEvent('senddata',{
        detail:{message:'hello from child'}});
   this.dispatchEvent(newEvent);
   }
    
}