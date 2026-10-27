import { LightningElement, track} from 'lwc';

export default class NewCalculator extends LightningElement {
 @ track finalValue;
 @track previousResult =[];
 @track showPreviousResult =false;

 firstNumber;
 secondNumber;

 numChangeHandler(event){
    const inputBoxName = event.target.name;
    
    if(inputBoxName ==='firstNumber'){
        this.firstNumber = event.target.value;
    }else if(inputBoxName ==='secondNumber'){
        this.secondNumber = event.target.value;
    }
 }
 addHandler(){
    const fNumber = parseInt(this.firstNumber);
    const sNumber = parseInt(this.secondNumber);

    this.finalValue = `value of ${fNumber} + ${sNumber} is ${fNumber+sNumber}`;
    this.previousResult.push(this.finalValue);
 }
 subHandler(){
    const fNumber = parseInt(this.firstNumber);
    const sNumber = parseInt(this.secondNumber);

    this.finalValue = `value of ${fNumber} - ${sNumber} is ${fNumber-sNumber}`;
    this.previousResult.push(this.finalValue);
 }
 mulHandler(){
    const fNumber = parseInt(this.firstNumber);
    const sNumber = parseInt(this.secondNumber);

    this.finalValue = `value of ${fNumber} * ${sNumber} is ${fNumber*sNumber}`;
    this.previousResult.push(this.finalValue);
 }
 divHandler(){
    const fNumber = parseInt(this.firstNumber);
    const sNumber = parseInt(this.secondNumber);

    this.finalValue = `value of ${fNumber} / ${sNumber} is ${fNumber/sNumber}`;
    this.previousResult.push(this.finalValue);
 }
 previosHandler(event){
    this.showPreviousResult = event.target.checked;
 }

}