import { api, LightningElement } from 'lwc';

export default class Child extends LightningElement {
    upperCaseName ='';
    lowerCaseName = 'giri';

    @api
    get itemName(){
        return this.upperCaseName;
    }
    set itemName(value){
        this.upperCaseName = value.toUpperCase();
    }
}