import { LightningElement, api } from 'lwc';

export default class MeetingRoom extends LightningElement {
    /*@api meetingRoomInfo;

    @api showRoomInfo = false;

    tileClickHandler() {
        const tileClicked = new CustomEvent('tileclick', { detail: this.meetingRoomInfo });
        this.dispatchEvent(tileClicked);
    }*/
    @api meetingRoomInfo;

    @api showRoomInfo = false;

    tileClickHandler() {
        const tileClicked = new CustomEvent('tileclick', { detail: this.meetingRoomInfo,bubbles:true });
        this.dispatchEvent(tileClicked);
    }
}