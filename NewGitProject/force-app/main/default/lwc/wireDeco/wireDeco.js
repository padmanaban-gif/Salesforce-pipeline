import { LightningElement,api,wire } from 'lwc';
import{getRecord,getFieldValue} from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';//importing field reference to access field api
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import ACTIVE_FIELD from '@salesforce/schema/Account.Active__c';
export default class WireDeco extends LightningElement {
    @api recordId;

    @wire(getRecord,{recordId:'$recordId',fields:[NAME_FIELD,PHONE_FIELD,ACTIVE_FIELD]})
    record;

    get name(){
        return this.record.data ? getFieldValue(this.record.data,NAME_FIELD): ' ';
    }
    get phone(){
        return this.record.data? getFieldValue(this.record.data,PHONE_FIELD): 'dont have phone number ';
    }
    get active(){
        return this.record.data? getFieldValue(this.record.data,ACTIVE_FIELD): 'dont have phone number ';
    }

}

// impo}rt {getRecord,getFieldValue} from 'lightning/uiRecordApi';
// const fields =[
//     'Account.Name',//directtly using string collection to access the object api
//     'Account.Phone'
// ];
// export default class WireDeco extends LightningElement {

//     @api recordId;

//     @wire(getRecord,{recordId: '$recordId',fields:fields})
//     record;
//     get name(){
//         //return this.record.data? getFieldValue(this.record.data,'Account.Name'):'';
//         return this.record.data.fields.Name.value;//can follow this when we rae using collection
//     }
//     get phone(){
//         //return this.record.data? getFieldValue(this.record.data,'Account.Phone'):'';
//         return this.record.data.fields.Phone.value;
//     }
// }}
//}