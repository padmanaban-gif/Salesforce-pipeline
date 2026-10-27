import { LightningElement,wire,track } from 'lwc';
import picValues from  '@salesforce/apex/DynamicPicklist.dynamicPicklistValues';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class DynamicPicklistComponent extends LightningElement {
    selectedValue;
    @track picklistOptions=[];
    @wire(picValues)
    wiredList({data,error}){
        if(data){
            this.picklistOptions = data.map(value=>({label:value,value}));
        }
        else if(error){
            console.error(error);
        }
    }
    handleChange(event){
        this.selectedValue = event.detail.value;
        this.dispatchEvent(new ShowToastEvent({
            title:'Success',
            message:'friend selected',
            variant:'success'
        }));
    }
}