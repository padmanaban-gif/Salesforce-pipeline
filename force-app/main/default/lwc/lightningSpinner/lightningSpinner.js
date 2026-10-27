import { LightningElement } from 'lwc';
import listOfContacts from '@salesforce/apex/ConList.conListDetails';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class LightningSpinner extends LightningElement {

    accounts;
    isLoading=  false;
    handleLoding(){
        this.isLoading = true;
        listOfContacts()
        .then(result=>{
            this.accounts=  result;
        })
        .catch(error=>{
            cosole.error(error);
        }
        )
        .finally(()=>{
            this.isLoading=false;
        });
        this.dispatchEvent(new ShowToastEvent({
            title:'Success',
            message:'Conatcts fetched successfullt',
            variant:'success'
        }));
    }
}