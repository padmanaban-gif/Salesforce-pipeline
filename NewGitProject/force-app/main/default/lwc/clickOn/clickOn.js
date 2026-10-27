import { LightningElement } from 'lwc';
//fetching data using queryselector
export default class ClickOn extends LightningElement {

    // Greeting = 'karthick';

    // handleClick(event){
    //     this.Greeting = this.template.querySelector('lightning-input').value;//single query selector
    // }

   FirstName = '';
   LastName ='';


   handleClick(event){
    var input = this.template.querySelectorAll('lightning-input');
    input.forEach(function(element){
        if(element.name ==='fname') 
            this.FirstName =  element.value;
        
        else if(element.name === 'lname')
            this.LastName = element.value;
        
    },this);
   }
}