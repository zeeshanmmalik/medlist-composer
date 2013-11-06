function savePrescription(btn_clicked){
    //alert('in save prescription');
    //if ($(this).data('clicked').is('[name=no_ajax]'))
    console.log(event.target);
    params = {};
    obj = {};

    obj['drugs_attributes'] = {};

    $('#drugs_table tr[data-drug-id]').each( function (index) {
        that = this;
        drug = {};
        if( $(this).attr('data-destroy') === undefined ){
            drug['_destroy'] = 'false'
        }else{
            drug['_destroy'] = $(this).attr('data-destroy');
        }
        drug['order_no'] = $(this).attr('data-order-no');
        $(this).find('[data-nested]').each( function () {
            if ( $(this).attr('data-nested-2') ) {                
                instruction = {};
                if( $(that).attr('data-new-drug') === undefined ){
                    // if not a new drug, set id attribute
                    instruction['id'] = $(this).attr('data-nnid');
                }

                instruction['line'] = $(this).attr('data-initval');
                //if( $(this).text() != '...' ){
                //    instruction['line'] = $(this).text();
                //}else{
                //    instruction['line'] = '';
                //}
                
                instruction['_destroy'] = 'false';
                
                if ( !("instructions_attributes" in drug) ){
                    drug['instructions_attributes'] = {};
                }
                drug['instructions_attributes'][$(this).attr('data-nnid')] = instruction;
            }else{
                drug[$(this).attr('data-name')] = $(this).attr('data-initval');
                //if( $(this).text() != '...' ){
                //    drug[$(this).attr('data-name')] = $(this).text();
                //}else{
                //    drug[$(this).attr('data-name')] = '';
                //}
            }
        });
        if( $(this).attr('data-new-drug') === undefined ){
            // if not a new drug... set id attribute
            drug['id'] = $(this).attr('data-drug-id');
        }
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

function btnPrintPreviewClicked() {
    console.log('print');
    window.location.href = '/prescriptions/' +
                           $('#drugs_table').attr('data-prescription-id') + '.pdf' +
                           '?patient_id=' + $('#patient_id').attr('data-patient-id') +
                           '&font_size=' + $.cookie('TEXT_SIZE');
}
