import { LightningElement } from 'lwc';

export default class CheckingTrack extends LightningElement {

    message = 'World';
    handleEvent(event){
        this.message = event.target.value;
    }
}