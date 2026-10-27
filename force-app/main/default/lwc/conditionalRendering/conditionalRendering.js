import { LightningElement,track } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    @track showEmployee = false;
   @track frndsList = ['jaya','mani','karthi'];
   @track areaList = ['chennai','bangalore','kochi'];
    showEmployeee(event){
        this.showEmployee = event.target.checked;
    }
}