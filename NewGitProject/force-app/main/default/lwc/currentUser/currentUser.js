import { LightningElement } from 'lwc';
import currentuser from '@salesforce/apex/CurrentUser.getcurrentUser';

export default class CurrentUser extends LightningElement {
    userData;

    connectedCallback(){
        this.getData();
    }

    async getData(){
        try{
            const userCurrentData = await currentuser();
            this.userData=userCurrentData;
        }
        catch(error){
         console.error = error;
        }
    }
}