import { LightningElement,api } from 'lwc';

export default class ParentToChild extends LightningElement {
    @api message;
}