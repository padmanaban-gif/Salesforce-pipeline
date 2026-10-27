import { LightningElement,track,wire } from 'lwc';
import pickValues from '@salesforce/apex/DynamicPicklist.dynamicPicklistValues';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class DemoDynamicPicklist extends LightningElement {
    @track accounts=[];
    selectedOptions;
    @wire(pickValues)
    wiredPics({data,error})
{
    if(data){
        this.selectedOptions= data.map(value=>({label:value,value}));
    }
    else if(error){
        console.error(error);
    }
}
handleChange(event){
    this.accounts = event.detail.value;
    this.dispatchEvent(new ShowToastEvent({
        title:'Success',
        message:'succeefully selected',
        variant:'success'
    }));
}
}