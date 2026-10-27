import { LightningElement,track } from 'lwc';

export default class SortTable extends LightningElement {
    @track data=[];
    @track columns =[
        {
            label:'Name',
            fieldName:'name',
            sortable:true
        },
        {
            label:'Age',
            fieldName:'age',
            sortable:true
        }
    ];
    sortedBy ='name';
    sortedDirection = 'asc';

    connectedCallback(){
        this.data=[
            {name:'Jon',age:25},
            {name:'jaya',age:36},
            {name:'karthi',age:26}
        ];
    }
    handleSort(event){
        this.sortedBy = event.detail.fieldName;
        this.sortedDirection= event.detail.sortDirection;
        this.sortData(this.sortedBy,this.sortedDirection);
    }
    sortData(fieldName,sortDirection){
        let data =JSON.parse(JSON.stringify(this.data));
        data.sort((a,b)=>{
        let valueA = a[fieldName];
        let valueB = b[fieldName];
        if(valueA <valueB){
            return sortDirection === 'asc'?-1:1;
        }
        if(valueA >valueB){
            return sortDirection === 'asc'?1:-1;
        }else{
            return 0;
        }
        
    });
    this.data = data;
    
}}