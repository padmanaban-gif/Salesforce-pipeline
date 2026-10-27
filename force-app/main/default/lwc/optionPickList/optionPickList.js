import { LightningElement } from 'lwc';

export default class OptionPickList extends LightningElement {

    selectedValue ='';
    options =['Option A','Option B'];

    handleChange(event){
        this.selectedValue = event.detail.value;
    }
    get sectionA(){
        return this.selectedValue ==='Option A';
    }
     get sectionB(){
        return this.selectedValue ==='Option B';
    }
}