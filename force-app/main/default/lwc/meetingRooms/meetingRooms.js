import { LightningElement, track } from 'lwc';

export default class MeetingRooms extends LightningElement {

   /* @track selecetdRoom;
    meetingRoomInfo = [
        { roomName: 'A1', roomCapacity: '14' },
        { roomName: 'B1', roomCapacity: '24' },
        { roomName: 'C1', roomCapacity: '34' }
    ];

    tileeClickHandler(event) {
        const meetingRoomInfo = event.detail;
        this.selecetdRoom = meetingRoomInfo.roomName;
    }*/
    @track selecetdRoom;
    meetingRoomInfo = [
        { roomName: 'A11', roomCapacity: '145' },
        { roomName: 'B11', roomCapacity: '245' },
        { roomName: 'C11', roomCapacity: '345' }
    ];

    tileeClickHandler(event) {
        const meetingRoomInfo = event.detail;
        this.selecetdRoom = meetingRoomInfo.roomName;
    }
    constructor(){
    
        super();
        this.template.addEventListener('tileclick', this.tileeClickHandler.bind(this));
    }
}