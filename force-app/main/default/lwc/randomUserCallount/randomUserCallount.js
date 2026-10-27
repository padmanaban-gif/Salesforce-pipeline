import { LightningElement } from 'lwc';
import userData from '@salesforce/apex/RandomUserCallout.getRandomUser';

export default class RandomUserCallount extends LightningElement {
    currentUser;
    error;
  connectedCallback(){
    this.getUserData();
  }
    async getUserData(){
        try{
        const response = await userData();
        const parsedResponse = JSON.parse(response);
        this.currentUser = parsedResponse.result[0];
    }
        catch(error){
            this.error = error;
            console.error(error);
        }
    }
}