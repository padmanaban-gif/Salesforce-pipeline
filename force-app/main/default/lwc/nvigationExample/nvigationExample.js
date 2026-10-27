import { LightningElement } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'

export default class NvigationExample extends NavigationMixin(LightningElement) {
openLink(){
    this[NavigationMixin.Navigate]({
    type:'standard__webPage',
    attributes:{
        url:'https://www.linkedin.com/in/padmanaban-pr-0829b61aa'
    }
 } )
}
openAccountHomeLink(){
    this[NavigationMixin.Navigate]({
       type:'standard__objectPage',
       attributes:{
        objectApiName:'Account',
        actionName:'home'
       } 
    })
}
openCaseRecordLink(){
    this[NavigationMixin.Navigate]({
        type:'standard__recordPage',
        attributes:{
            recordId:'003dM00000N7DsxQAF',
            objectApiName:'Contact',
            actionName:'view'
        }
    })
}
openMeetingTabLink(){
    this[NavigationMixin.Navigate]({
        type:'standard__navItemPage',
        attributes:{
            apiName:'Meeting_Room_Tab'
        }
    })
}
}