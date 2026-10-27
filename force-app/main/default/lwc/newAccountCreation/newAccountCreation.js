import { LightningElement, track} from 'lwc';
import myAccount from '@salesforce/apex/NewAccountCreation.newAccount';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class NewAccountCreation extends LightningElement {
    @track accountName;

    handleCreation(){
        myAccount({accountName : this.accountName})
            .then((result) =>{
                this.dispatchEvent(
                    new ShowToastEvent({
                        title:'Success',
                        message:result,
                        variant:'success'
                    })
             ); 
            this.accountName ='';
            })
            
        .catch((error) =>
            this.dispatchEvent(
                    new ShowToastEvent({
                       title:'Error',
                       message:error.body.message,
                       variant:'error' 
                    })
            )
        );

     }
            
}