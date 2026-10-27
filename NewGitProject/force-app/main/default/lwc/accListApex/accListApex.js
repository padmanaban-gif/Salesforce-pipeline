/*import { LightningElement,wire} from 'lwc';
import allAccounts from '@salesforce/apex/accList.newAccList';
//CALLING THE METHOD USING WIRE METHOD
 
export default class AccListApex extends LightningElement {

    @wire(allAccounts)
    accounts;

    get response(){
        if(this.accounts){
            return true;
        }
        return false;
    }
}*/

import { LightningElement,track} from 'lwc';
import allAccounts from '@salesforce/apex/accList.newAccList';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
//Compare with snippet from c:';
 //CALLING APX METHOD IN IMPERATIVE WAY
export default class AccListApex extends LightningElement {

   @track numOfRecords;
   @track accounts;

    get response(){
        if(this.accounts){
            return true;
        }
        return false;
    }
    numChnage(event){
        this.numOfRecords = event.target.value;
    }
    getAccounts(){
        allAccounts({NoOfRecords: this.numOfRecords}).then(response=>{
       this.accounts = response;
       const toastEvent = new ShowToastEvent({
         title :'Accounts Retrived',
         message :this.numOfRecords + 'Accounts retrived',
         variant :'success',
       });
       this.dispatchEvent(toastEvent);
        }
    ).catch(error =>{
        console.error('error identified',error.body.message);
        const toastEvent = new ShowToastEvent({
            title :'ERROR',
            message :error.body.message,
            variant:'error',
        });
        this.dispatchEvent(toastEvent);

    })
        }
    
    }