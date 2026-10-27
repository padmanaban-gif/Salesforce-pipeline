import { LightningElement,api } from 'lwc';

export default class PriPubDemo extends LightningElement {
    Message = 'public property';
    @api recordId;
}