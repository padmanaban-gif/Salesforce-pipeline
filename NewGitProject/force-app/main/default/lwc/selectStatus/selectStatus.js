import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class SelectStatus extends LightningElement {
    status ='';
    isApprooved = false;
    handleChange(event){
        this.status =event.detail.value;
    this.isApprooved = this.status == this.template.querySelector('lightning-combobox').value;
    this.dispatchEvent(new ShowToastEvent({
        title:'Success',
        message:'Ststus selected',
        variant:'success'
    }));
    }
    get statusOptions(){
        return[{
          label: 'Approoved',value:'Approoved'},
          {label:'Pending',value:'Pending'},
          {label:'Declined',value:'Declined'}
        ];
    }
    
}