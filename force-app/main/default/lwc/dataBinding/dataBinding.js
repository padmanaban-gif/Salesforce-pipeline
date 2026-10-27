import { LightningElement,track } from 'lwc';

export default class DataBinding extends LightningElement {

 @track greeting = 'Jaya';

 newEmployee(event){
  this.greeting = event.target.value;
 }
}