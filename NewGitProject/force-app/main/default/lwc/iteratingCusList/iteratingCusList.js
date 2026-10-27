import { LightningElement } from 'lwc';

export default class IteratingCusList extends LightningElement {
    Contacts = [
        {
            Id : 264,
            Name : 'rohit',
            Sports: 'Cricket'
        },
        {
            Id : 180,
            Name : 'Virat',
            Sports: 'Cricket'
        },
        {
            Id : 170,
            Name : 'Dhoni',
            Sports: 'Cricket'
        },
    ];
}