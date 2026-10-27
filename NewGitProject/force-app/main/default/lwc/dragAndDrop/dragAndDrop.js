import { LightningElement,track } from 'lwc';

export default class DragAndDrop extends LightningElement {
 @track availableItems = [
    {id:'1',name:'item1'},
    {id:'2',name:'item2'},
    {id:'3',name:'item3'}
 ];
  @track selectedItems=[];

  handleDragStart(event){
    this.availableItems = event.dataTransfer.setData('text/plain',event.target.dataset.Id);
  }
  allowDrop(event){
    event.preventDefault();
  }
  hadleDrop(event){
    event.preventDefault();
    const itemId = event.dataTransfer.getDate('text/plain');
    const item = this.availableItems.fine(i=> i.Id === itemId);
    if(item){
        this.selectedItems = [...this.selectedItems,item];
        this.availableItems = this.availableIytems.filter(i=> i.Id !== itemId);
    }
  }

}