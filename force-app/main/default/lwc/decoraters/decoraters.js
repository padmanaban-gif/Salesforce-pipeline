import { LightningElement,api } from 'lwc';

export default class Decoraters extends LightningElement {
    message ='welcome to my lightning component';
    @api recordId;
}