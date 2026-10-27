import { LightningElement } from 'lwc';
import createCase from '@salesforce/apex/CreateClass.createNewClass';
import{ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateCaseComponent extends LightningElement {
    subject;
    description;

    handleSubject(event){
        this.subject = event.target.value;
    }
    handleDescription(event){
        this.description =event.target.value;
    }
    handleCreate(){
        const caseRecord={
            Subject :this.subject,
            Description :this.description
        };
    
    createCase({newCase :caseRecord})
        .then(() =>{
        this.dispatchEvent(new ShowToastEvent({
            title:'Success',
            message:'Case is created successfully',
            variant:'success'
        })
    )
        }).catch((error)=>{
            this.dispatcEvent(new ShowToastEvent({
                title:'error',
                message:error.body.message,
                variant:'error'
            }))
        })
    

} 
}