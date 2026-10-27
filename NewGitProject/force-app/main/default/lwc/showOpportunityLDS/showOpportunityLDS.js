import { LightningElement,api } from 'lwc';
import active from '@salesforce/schema/Opportunity.Active__c';
import name from '@salesforce/schema/Opportunity.Name';

export default class ShowOpportunityLDS extends LightningElement {
    @api recordId;
    @api objectApiName;
    fieldsArray = ['active','name'];
    hadleSuccess(event){
        this.recordId = event.detail.Id;
    }
}