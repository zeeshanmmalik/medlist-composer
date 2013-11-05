function savePrescription(btn_clicked){
    //alert('in save prescription');
    //if ($(this).data('clicked').is('[name=no_ajax]'))
    console.log(event.target);
    params = {};
    obj = {};

    obj['drugs_attributes'] = {};

    $('#drugs_table tr[data-drug-id]').each( function (index) {
        drug = {};
        $(this).find('[data-nested]').each( function () {
            if ( $(this).attr('data-nested-2') ) {                
                instruction = {};
                instruction['id'] = $(this).attr('data-nnid');

                if( $(this).text() != '...' ){
                    instruction['line'] = $(this).text();
                }else{
                    instruction['line'] = '';
                }
                
                instruction['_destroy'] = 'false';
                
                if ( !("instructions_attributes" in drug) ){
                    drug['instructions_attributes'] = {};
                }
                drug['instructions_attributes'][$(this).attr('data-nnid')] = instruction;
            }else{
                if( $(this).text() != '...' ){
                    drug[$(this).attr('data-name')] = $(this).text();
                }else{
                    drug[$(this).attr('data-name')] = '';
                }
            }
        });
        drug['id'] = $(this).attr('data-drug-id');
        obj['drugs_attributes'][$(this).attr('data-drug-id')] = drug;
        obj['pharmacist_id'] = $('#pharmacist_id').attr('data-pharmacist-id');
        if( btn_clicked == 'final' ){
            console.log('final');
            obj['status'] = 'final';
        }else{
            console.log('save');
            obj['status'] = 'editable';
        }
        
    });

    params['prescription'] = obj;

    $.ajax({
        url: '/prescriptions/' + $('#drugs_table').attr('data-prescription-id'),
        data: params,
        type: 'PUT',
        dataType: 'json',
        success: function(data)
        {
            console.log("form success"); // show response from the php script.
        }
    });

    
    return false;
}

function btnSaveClicked() {
    console.log('save');
    savePrescription('save');
}

function btnFinalizeClicked() {
    console.log('finalize');
    savePrescription('final');
}
