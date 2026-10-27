import { LightningElement,track,wire } from 'lwc';
import getAccount from '@salesforce/apex/CreateUpdateAccount.getAccount';
import updateAccount from '@salesforce/apex/CreateUpdateAccount.updateAccount';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateAndUpdateInlineEdit extends LightningElement {
    @track data=[];
    @track columns = [
    {label:'Account Name',fieldName:'Name',editable:true},
    {label:'Account Industry',fieldName:'Industry',editable:true},
{label:'Account Phone', fieldName:'Phone',editable:true}];
    @track draftValues=[];

    @wire(getAccount)
    wiredAccounts({data,error}){
        if(data){
            this.data = data;
        }
        else if(error){
 console.error(error);           
        }
    }
    handleSave(event){
        const updatedAccount= event.detail.draftValues;
        const promises = updatedAccount.map((record)=>{
            return updateAccount({Id:record.id,Name:record.Name,Phone:record.Phone,Industry:record.Industry});
        });
        Promise.all(promises)
        .then(()=>{
            this.dispatchEvent(
                new ShowToastEvent({
                title:'Success',
                message:'Accounts updated',
                variant:'success'
            }) );
            this.draftValues=[];
        })
        .catch((error)=>{
          console.error(error);
          this.dispatchEvent(
            new ShowToastEvent({
            title:'Error',
            message:'Accounts not updated',
            variant:'error'
          })
          ); })
        }}