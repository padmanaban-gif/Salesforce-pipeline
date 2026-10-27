import { LightningElement } from 'lwc';
import templateOne from './templateOne.html';
import templateTwo from './templateTwo.html';
export default class MulTemplates extends LightningElement {

    templateOne = true;

    render(){
        return this.templateOne? templateOne:templateTwo;
    }
    switchTemplate(event){
        this.templateOne = this.templateOne? false:true;
    }
}