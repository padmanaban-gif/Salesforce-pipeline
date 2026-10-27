import { LightningElement, track} from 'lwc';
import showOrderDetails from '@salesforce/apex/ShowOrder.showOrderDetails';

export default class ShowOrderRecords extends LightningElement {
    @track orders =[];
    @track startDate;
    @track endDate;
    @track error;
    changeStartDate(event){
        this.startDate = event.target.value;
    }
    changeEndDate(event){
        this.endDate=  event.target.value;
    }
    handleOrders(event){
        if(this.startDate && this.endDate){
            const{startDate,endDate}= event.detail;
        showOrderDetails({startDate:new Date(this.startDate),endDate:new Date(this.endDate)} )
        .then(result =>{
           this.orders = result;
           this.error = undefined;
        })
        .catch(error=>{
             this.error = error;
             this.orders = undefined;
        });

        }}
    
}