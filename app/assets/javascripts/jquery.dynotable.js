/* 
 *  jquery.dynotable.js
 *  Created on Aug 1, 2011 3:36:39 PM by bob
 */
(function($){
    $.fn.extend({
        dynoTable: function(options) {
            
            var defaults = {
                removeClass: '.row-remover',
                cloneClass: '.row-cloner',
                addRowTemplateId: '#add-template',
                addRowButtonId: '#add-row',
                lastRowRemovable: false,
                orderable: true,
                dragHandleClass: ".drag-handle",
                insertFadeSpeed: "slow",
                removeFadeSpeed: "fast",
                hideTableOnEmpty: true,
                onRowRemove: function(){},
                onRowClone: function(){},
                onRowAdd: function(){},
                onTableEmpty: function(){},
                onRowReorder: function(){}
            };     
            
            options = $.extend(defaults, options);
                                                                        
            var cloneRow = function(btn) {
                var clonedRow = $(btn).closest('tr').clone();  
                var tbod = $(btn).closest('tbody');
                insertRow(clonedRow, tbod, btn); 
                options.onRowClone();
            }
                        
            var insertRow = function(clonedRow, tbod, btn) {                
                var numRows = $(tbod).children("tr").length;
                if(options.hideTableOnEmpty && numRows == 0) {
                    $(tbod).parents("table").first().show();
                }
                
                $(clonedRow).find('*').andSelf().filter('[id]').each( function() {
                    //change to something else so we don't have ids with the same name
                    this.id += '__c';
                });

                //finally append new row to end of table
                if(options.hideTableOnEmpty && numRows == 0) {
                    $(tbod).append( clonedRow );
                }
                else {
                    $(btn).closest('tr').after( clonedRow );
                }
                bindActions(clonedRow);
                $(tbod).children("tr:last").hide().fadeIn(options.insertFadeSpeed);

                // set tmp id attributes for new drug
                clonedRow.attr('data-new-drug',true);
                var new_drug_tmp_id = $.now();
                clonedRow.attr('data-drug-id', new_drug_tmp_id);
                // set tmp ids for nested instructions
                clonedRow.find('[data-nested-2]').each( function(index) {
                    $(this).attr('data-nnid', $.now() + index);
                });
                // reset data-nid for all drug attributes
                clonedRow.find('[data-nid]').each( function(index) {
                    $(this).attr('data-nid', new_drug_tmp_id);
                });                
                // apply autocomplete search
                clonedRow.find('[data-editable]').each(function() {
                               applyAutoCompleteSearch.apply(this, arguments);
                             });
                // apply x-editable
                clonedRow.find('[data-editable]').editable();
                
                
            }
                        
            var removeRow = function(btn) {
                var tbod = $(btn).parents("tbody:first");
                var numRows = $(tbod).children("tr").length;
        
                if(numRows > 1 || options.lastRowRemovable === true) {
                    var trToRemove = $(btn).parents("tr:first");
                    $(trToRemove).fadeOut(options.removeFadeSpeed, function() {
                        //Since we want to remove the drug from database.
                        //Don't remove from the DOM, just hide the row
                        //$(trToRemove).remove();
                        $(trToRemove).hide();
                        options.onRowRemove();
                        if(numRows == 1) {
                            if(options.hideTableOnEmpty) {
                                $(tbod).parents('table').first().hide();
                            }
                            options.onTableEmpty();
                        }

                        $(trToRemove).attr('data-destroy', 1);
                    });
                }                            
            }
                        
            var bindClick = function(elem, fn) {
                $(elem).click(fn);                
            }                  
                        
            var bindCloneLink = function(lnk) {
                bindClick(lnk, function(){                                
                    var btn = $(this);
                    cloneRow(btn); 
                    return false;
                });
            }
                        
            var bindRemoveLink = function(lnk) {
                bindClick(lnk, function(){ 
                    var btn = $(this);
                    removeRow(btn);
                    return false;
                });
            }
                        
            var bindActions = function(obj) {              
                obj.find(options.removeClass).each(function() {
                    bindRemoveLink($(this));
                });

                obj.find(options.cloneClass).each(function() {
                    bindCloneLink($(this));
                });


            }
         
            return this.each(function() {                             
                //Sanity check to make sure we are dealing with a single case
                if(this.nodeName.toLowerCase() == 'table') {                                
                    var table = $(this);
                    var tbody = $(table).children("tbody").first();
                                
                    if(options.orderable && jQuery().sortable) {                        
                        $(tbody).sortable({
                            handle : options.dragHandleClass,
                            helper:  function(e, ui) {
                                ui.children().each(function() {
                                    $(this).width($(this).width());
                                });
                                return ui;
                            },
                            items: "tr",
                            update : function (event, ui) {
                                options.onRowReorder();
                            }
                        });
                    }                                 
                                
                    $(table).find(options.addRowTemplateId).each(function(){
                        $(this).removeAttr("id");
                        var tmpl = $(this);
                        tmpl.remove();                        
                        bindClick($(options.addRowButtonId), function(){ 
                            var newTr = tmpl.clone();
                            insertRow(newTr, tbody);
                            options.onRowAdd();
                            return false;
                        });
                    });                                
                    bindActions(table);
                    
                    var numRows = $(tbody).children("tr").length;
                    if(options.hideTableOnEmpty && numRows == 0) {
                        $(table).hide();
                    }
                }                 
            });
        }
    });
})(jQuery); 
