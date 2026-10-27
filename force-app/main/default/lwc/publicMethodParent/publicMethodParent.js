import { LightningElement, track } from 'lwc';

export default class PublicMethodParent extends LightningElement {

    @track value;
    changeCheckboxValue() {
        const childComponent = this.template.querySelector('c-public-method-child');
        childComponent.selectCheckBox(this.value);
    }
    changeValue(event) {
        this.value = event.target.value;
    }
}