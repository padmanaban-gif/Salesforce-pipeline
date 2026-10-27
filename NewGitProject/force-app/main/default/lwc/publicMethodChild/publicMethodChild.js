import { LightningElement, track, api } from 'lwc';

export default class PublicMethodChild extends LightningElement {

    @track value = ['red'];

    options = [
        { label: 'green colour', value: 'green' },
        { label: 'yellow colour', value: 'yellow' },
        { label: 'orange colour', value: 'orange' },
        { label: 'blue colour', value: 'blue' },
    ];

    @api selectCheckBox(checkBoxValue) {
        const selectedCheckbox = this.options.find(checkbox => {
            return checkBoxValue === checkbox.value;

        })
        if (selectedCheckbox) {
            this.value = selectedCheckbox.value;
        }
    }
}