import { LightningElement } from 'lwc';
import newColors from '@salesforce/apex/ColorController.getColor';
export default class ColorController extends LightningElement {
    colors =[
        {label:'Red', value:'Red'},
        {label:'Green',value:'Green'},
        {label:'Yellow', value:'Yellow'}
    ];
    selectedcolors = [''];

    handleColorChange(event){
        this.selectedcolors= event.detail.value;
    }
  handleClick(){
    newColors({colors:this.selectedcolors})
    .then((result)=>{
        console.log('Colors submitted successfully', result);
        //this.selectedcolors = result;
    })
    .catch((error)=>{
        console.log('Error occured', error);
    })
  }
}