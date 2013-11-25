function savePrescription(btn_clicked){
    enableLoadingClasses();
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
        drug['empty_space'] = $(this).attr('data-empty-space');
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
        dataType: 'json'
    })
    .done( function() {
        console.log("form success"); 
        disableLoadingClasses();
        $('#alert_msg').addClass('alert-success').text('Discharge Medication List succesfully saved!').animate({
            width: "toggle",
            height: "toggle",
            opacity: "toggle"
        }, {
            duration: "slow"
        }).delay(5000).fadeOut(300);
    })
    .fail( function() {
        console.log("request failed");
        disableLoadingClasses();
        $('#alert_msg').addClass('alert-error').html('<b>Oh snap!</b> Could not save changes due to error in the server.').animate({
            width: "toggle",
            height: "toggle",
            opacity: "toggle"
        }, {
            duration: "slow"
        }).delay(10000).fadeOut(300);
    });
    
    return false;
}

function enableLoadingClasses() {
    $('#loading_image').removeClass('hide');
    $('.btn-group button').addClass('disabled');
    $('.btn-group button').attr('disabled','disabled');

}

function disableLoadingClasses() {
    $('#loading_image').addClass('hide');
    $('.btn-group button').removeClass('disabled');
    $('.btn-group button').removeAttr('disabled');
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
    enableLoadingClasses();
    window.location.href = '/prescriptions/' +
                           $('#drugs_table').attr('data-prescription-id') + '.pdf' +
                           '?patient_id=' + $('#patient_id').attr('data-patient-id') +
                           '&font_size=' + $.cookie('TEXT_SIZE');
}
