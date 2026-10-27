import { LightningElement,api } from 'lwc';
import{NavigationMixin} from'lightning/Navigation';

export default class NavigationAccount extends NavigationMixin(LightningElement) {
    @api recordId;
    handleNavigation(){
       this[NavigationMixin.Navigate]({
        type:'standard__recordPage',
        attributes:{
            recordId: this.recordId,
            objectApiName:'Contact',
          actionName:'view'
        }
       });
    }
}