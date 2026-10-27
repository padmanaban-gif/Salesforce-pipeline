/*import { LightningElement,track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';

export default class AccountManager extends LightningElement {
    @track accountName;
    @track accountPhone;
    @track accountWebsite;

    accountNameHnadler(event){
        this.accountName = event.target.value;
    }
    accountPhoneHnadler(event){
        this.accountPhone = event.target.value;
    }
    accountWebsiteHnadler(event){
        this.accountWebsite = event.target.value;
    }
    createAccount(){
        const fields ={'Name':this.accountName,'Phone':this.accountPhone, 'Website': this.accountWebsite};
        const recordInput = {apiName:'Account', fields};

        createRecord(recordInput).then(response =>{
            console.log('Account has been created :',response.id);
        }).catch(error =>{
              console.error(error.body.message);
        });

        }
    }*/
    import { LightningElement,track,wire } from 'lwc';
import { createRecord,getRecord} from 'lightning/uiRecordApi';

const fieldArray =['Account.Name','Account.Phone','Account.Website'];
export default class AccountManager extends LightningElement {
    @track accountName;
    @track accountPhone;
    @track accountWebsite;

    @track recordId;

    @wire(getRecord,{recordId:'$recordId', fields:fieldArray})
    newAccRecord;

    accountNameHnadler(event){
        this.accountName = event.target.value;
    }
    accountPhoneHnadler(event){
        this.accountPhone = event.target.value;
    }
    accountWebsiteHnadler(event){
        this.accountWebsite = event.target.value;
    }
    createAccount(){
        const fields ={'Name':this.accountName,'Phone':this.accountPhone, 'Website': this.accountWebsite};
        const recordInput = {apiName:'Account', fields};

        createRecord(recordInput).then(response =>{
            console.log('Account has been created :',response.id);
            this.recordId = response.id;
        }).catch(error =>{
              console.error(error.body.message);
        });

        }
        get accname(){
            if(this.newAccRecord.data){
                return this.newAccRecord.data.fields.Name.value;
            }
            return undefined;
        }
        get accPhone(){
            if(this.newAccRecord.data){
                return this.newAccRecord.data.fields.Phone.value;
            }
            return undefined;
        }
        get accWebiste(){
            if(this.newAccRecord.data){
                return this.newAccRecord.data.fields.Website.value;
            }
            return undefined;
        }
    }