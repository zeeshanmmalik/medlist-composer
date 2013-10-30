(function() {
    jQuery(function($) {
        var EditableForm;
        EditableForm = $.fn.editableform.Constructor;
        EditableForm.prototype.saveWithUrlHook = function(value) {
            var originalUrl, resource,
            _this = this;
            originalUrl = this.options.url;
            resource = this.options.resource;
            this.options.url = function(params) {
                var obj;
                if (typeof originalUrl === 'function') {
                    return originalUrl.call(_this.options.scope, params);
                } else if ((originalUrl != null) && _this.options.send !== 'never') {
                    obj = {};
	                  if ( "nested" in _this.options ){
	                      nested = _this.options.nested;
	                      nid = _this.options.nid;
	                      obj[nested+"_attributes"] = {};
	                      obj[nested+"_attributes"][nid] = {};
	                      obj[nested+"_attributes"][nid][params.name] = params.value;
                        obj[nested+"_attributes"][nid]["id"] = nid;
                        obj[nested+"_attributes"][nid]["_destroy"] = false;
	                  } else {
                        obj[params.name] = params.value;
                    }
                    if (resource) {
                        params[resource] = obj;
                    } else {
                        params = obj;
                    }
                    delete params.name;
                    delete params.value;
                    delete params.pk;
                    return $.ajax($.extend({
                        url: originalUrl,
                        data: params,
                        type: 'PUT',
                        dataType: 'json'
                    }, _this.options.ajaxOptions));
                }
            };
            return this.saveWithoutUrlHook(value);
        };
        EditableForm.prototype.saveWithoutUrlHook = EditableForm.prototype.save;
        return EditableForm.prototype.save = EditableForm.prototype.saveWithUrlHook;
    });

}).call(this);
