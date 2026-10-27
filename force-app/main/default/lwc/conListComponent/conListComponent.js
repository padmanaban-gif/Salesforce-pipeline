import { LightningElement,track,wire} from 'lwc';
import conListDetails from '@salesforce/apex/ConList.conListDetails';

export default class ConListComponent extends LightningElement {
    /*@track accList =[];

    connectedCallback(){
        conListDetails().then(result =>{
        this.accList = result;
        })

        .catch(error=>{
            console.error(error);
        });
    }*/
    @track accList=[];
   @wire(conListDetails)
   wiredContacts({data,error}){
    if(data){
        this.accList = data;
    }
    else if(error){
        console.error(error);
    }
   }
}