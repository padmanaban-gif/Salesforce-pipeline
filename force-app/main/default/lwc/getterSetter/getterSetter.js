import { LightningElement } from 'lwc';

export default class GetterSetter extends LightningElement {
   myProperty='';

   get myNewProperty(){
    return 'old world';
   }
   set myNewProperty(newValue){
    this.myProperty = newValue.toUpperCase();
   }
    hendleEvent(event){
        this.myNewProperty = event.target.value;
    }
}