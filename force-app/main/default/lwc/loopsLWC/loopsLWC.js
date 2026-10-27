import { LightningElement,wire } from 'lwc';
import welcome from '@salesforce/apex/WireClass.sayHello';
import lisOfCons from '@salesforce/apex/WireClass.conList';
export default class LoopsLWC extends LightningElement {
    message = '';
    error ='';
    recordId ='';
    salesforceConList;
    ContactList = [
        {
           Name: 'jaya',
           age: 25,
           Bank: 'idfc',
           City:'salem'
        },
        {
            Name: 'mani',
            age: 25,
            Bank: 'Informationtechnology'
         },
         {
            Name: 'jaya',
            age: 25,
            Bank: 'Developer'
         },
    ]
    @wire(welcome)
    newData({data,error}){
       if(data){
        //console.log(data);
        this.message = data;
       }else if(error){
        this.error =  JSON.stringify(error);
        console.error(error)
       }
    }
    @wire(welcome)
    newBulkData(result){
        const{data,error} = result;
       if(data){
        //console.log(data);
        this.message = data;
       }else if(error){
        this.error =  JSON.stringify(error);
        console.error(error)
       }
    }
    @wire(lisOfCons,{accId :'$recordId', email:""})
    wiredContacts(result){
        const{data,error} = result;
        if(data){
            console.log('console data', data);
            this.salesforceConList = data;
            this.salesforceConList.forEach((item)=>{
                console.log(item);
                item.email ='abe@gmail.com';         
             });
             console.log('salesforce clolist data', this.salesforceConList);
        }else if(error){
            this.error = JSON.Strigyfy(error);
        }
    }
}