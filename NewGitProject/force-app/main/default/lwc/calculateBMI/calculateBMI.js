import { LightningElement, track } from 'lwc';
import {getBmi} from 'c/exportBMI';

export default class CalculateBMI extends LightningElement {
    @track bmiData = {
        weight: 0,
        height: 0,
        result: 0
    };
    weightChange(event) {
        this.bmiData.weight = parseInt(event.target.value);
    }
    heightChange(event) {
        this.bmiData.height = parseInt(event.target.value);
    }
    BMICalculate() {
        //this.bmiData.result = this.bmiData.weight / (this.bmiData.height * this.bmiData.height);
        this.bmiData.result = getBmi(this.bmiData.weight,this.bmiData.height);
    }
    get bmiValue() {
        if (this.bmiData.result === 'undefined') {
            return " ";
        }
        return 'your bmi value is :' + this.bmiData.result;
    }

}