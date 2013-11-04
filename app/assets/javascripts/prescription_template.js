function savePrescription(event){
    alert('in save prescription');
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
    });

    params['prescription'] = obj;

    $.ajax({
        url: '/prescriptions/' + $('#drugs_table').attr('data-prescription-id'),
        data: params,
        type: 'PUT',
        dataType: 'json',
        success: function(data)
        {
            alert("form success"); // show response from the php script.
        }
    });

    
    return false;
}

