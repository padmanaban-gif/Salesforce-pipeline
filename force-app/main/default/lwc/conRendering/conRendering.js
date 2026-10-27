import { LightningElement } from 'lwc';

export default class ConRendering extends LightningElement {
 areDetailsIsVisible =false;

 handleChange(event){
      this.areDetailsIsVisible = event.target.checked;
 }
}