import { LightningElement,wire } from 'lwc';
import getAccounts from '@salesforce/apex/WiringAccountDetails.getAccount';
import createAccounts from '@salesforce/apex/WiringAccountDetails.insertAccount';

export default class WiringAccountDetailsLWC extends LightningElement {
    listDetails = '';
    @wire(getAccounts)
    accounts;

    handleClick(){
        createAccounts()
        .then((response) =>{
            this.listDetails = JSON.stringify(response);
        })
        .catch((error) =>{
         console.log(error);
        })
    }
}