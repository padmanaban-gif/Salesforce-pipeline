import { LightningElement } from 'lwc';
import listOfOpps from '@salesforce/apex/WireClass.oppList';
export default class ToCaeteOppList extends LightningElement {

    handleClick(event){
        let button = event.target.value;
        listOfOpps(button)
        .then((oppeList)=>{
            this.oppeList = oppeList;
        })
        }
    }