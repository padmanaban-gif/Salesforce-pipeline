import { LightningElement,track } from 'lwc';
import{subscribe,unSubscribe,onError} from 'lightning/empApi';

export default class AccountPlatformEvent extends LightningElement {
    platformChannel ='/event/Create_Account__e';
    subcribtion={};
    @track accountList=[];

    connectedCallback(){
        this.subscribeToEvent();
    }
    subscribeToEvent() {
    subscribe(this.platformChannel, -1, this.messageCallback).then(response => {
        console.log(JSON.stringify(response.channel));
        this.subscription = response;
    });
}


        handleUnsubscribe(){
         unSubscribe(this.subcribtion,response=>{
            console.log('',JSON.stringify(response));
         });
        }
        disconnectedCallback(){
            this.handleUnsubscribe();
        }
        messageCallback(response){
            let accId = response.data.payload.Record_Id__c;
            let accName = response.data.payload.Record_Name__c;
            let recPath = '/'+response.data.payload.Record_Id__c;
            this.accountList.push({'Id':accId,'Name':accName,'Path':recPath});
            console.log(JSON.strigyfy(this.accountList));        }
    }