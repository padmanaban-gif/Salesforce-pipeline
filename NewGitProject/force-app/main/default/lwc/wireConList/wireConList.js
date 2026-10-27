import { LightningElement,api,wire } from 'lwc';
import conList from '@salesforce/apex/ConList.getConList';
//import {gerRecord} from 'lightning/uiRecordApi';
export default class WireConList extends LightningElement {
  @api recordId;

//   @wire(gerRecord,{recordId:'$recordId',fields:['Account.Name']})
//   records;
  @wire(conList,{accId:'$recordId'})
  contacts;
}