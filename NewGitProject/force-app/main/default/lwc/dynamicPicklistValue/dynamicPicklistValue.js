import { LightningElement,track,wire } from 'lwc';
import {getPickListValues, getObjectInfo} from 'lightning/uiObjectInfoApi';
import Object_Account from '@salesforce/schema/Account';
import Field_Industry from '@salesforce/schema/Account.Industry';

export default class DynamicPicklistValue extends LightningElement {

    @track picklistOptions =[];
    @wire(getObjectInfo,{objectApiName:Object_Account})
    objInfo;
    @wire(getPickListValues,{recordTypeId:'$objInfo.data.defaultRecordTypeId',
        fieldApiName:Field_Industry
    })
    wiredPickValues({data,error}){
        if(data){
            this.picklistOptions = data.values.map(item=>({
                label:item.label,
                value:item.value
            }));
        }else{
            console.error(error);
        }
    }
}