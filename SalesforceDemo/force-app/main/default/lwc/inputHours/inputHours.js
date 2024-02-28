import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const columns = [
    { label: 'Project', fieldName: 'Project', type: 'text' },
    { label: 'Monday', fieldName: 'Monday', type: 'text' },
    { label: 'Tuesday', fieldName: 'Tuesday', type: 'text' },
    { label: 'Wednesday', fieldName: 'Wednesday', type: 'text' },
    { label: 'Thursday', fieldName: 'Thursday', type: 'text' },
    { label: 'Friday', fieldName: 'Friday', type: 'text' },
    { label: 'Saturday', fieldName: 'Saturday', type: 'text' },
    { label: 'Sunday', fieldName: 'Sunday', type: 'text' }
];


export default class LookupExample extends LightningElement {

columns = columns;
data = [];
i=0;
newRow= [];
    handleSuccess(event) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: event.detail.apiName + ' created.',
                variant: 'success',
            })
        );
    }

    handleChange(event) {
        console.log('You selected an account: ' + event.detail.value[0]);
    }


   
   addRow(){
    alert(this.i);
    this.i += 1;
    this.newRow.push({Id:this.i,Project: 'PJ001',Monday : 4 });
    this.data = this.newRow;
   }

    getSelectedName(event) {
        const selectedRows = event.detail.selectedRows;
        // Display that fieldName of the selected rows
        for (let i = 0; i < selectedRows.length; i++) {
            alert('You selected: ' + selectedRows[i].Id);
        }
    }
}
