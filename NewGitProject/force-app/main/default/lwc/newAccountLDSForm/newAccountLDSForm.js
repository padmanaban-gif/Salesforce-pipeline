/*import { LightningElement,track} from 'lwc';

/*import Name from '@salesforce/schema/Account.Name';
import Phone from '@salesforce/schema/Account.Phone';
import Website from '@salesforce/schema/Account.Website';


export default class NewAccountLDSForm extends LightningElement {
    @track recordId;
    //can call like below when we are using field reference
    //fieldsArray = [Name,Phone,Website];
    //fieldsArray = ['Name','Phone','Website'];
    handleEvent(event){
        this.recordId = event.detail.Id;
    }
}*/

import { LightningElement,api} from 'lwc';

/*import Name from '@salesforce/schema/Account.Name';
import Phone from '@salesforce/schema/Account.Phone';
import Website from '@salesforce/schema/Account.Website';*/


export default class NewAccountLDSForm extends LightningElement {
    @api recordId;
    @api objectApiName;
    //can call like below when we are using field reference
    //fieldsArray = [Name,Phone,Website];
    //fieldsArray = ['Name','Phone','Website'];
    handleEvent(event){
        this.recordId = event.detail.Id;
    }
}