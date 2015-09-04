require 'builder'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Select < RailsAdmin::Config::Fields::Association
          RailsAdmin::Config::Fields::Types.register(self)
          include RailsAdmin::Engine.routes.url_helpers

          register_instance_option :view_helper do
            :select
          end

          register_instance_option :pretty_value do
            v = bindings[:view]
            o = bindings[:object]
            value = o.send(name)
            collection = association.klass.order(associated_model_config.object_label_method).all
            v.select_tag(name, v.options_from_collection_for_select(collection, :id, associated_model_config.object_label_method, value.try(:id)),
                         onchange: "var $t = $(this); $t.before('<i class=\"fa fa-spinner fa-spin\"></i>'); $.ajax({type: 'POST', url: '#{select_path(model_name: @abstract_model, id: o.id, method: association.foreign_key)}' + '&value=' + $t.val(), data: {ajax:true}, success: function(r) { $t.prev().remove(); $t.animate({ boxShadow: '0px 0px 10px #33CC33' }, 300).animate({ boxShadow: '' }, 700) }, error: function(e) { alert(e.responseText); }}); return false;"
                        )
          end

          register_instance_option :export_value do
            value.inspect
          end

          # Accessor for field's help text displayed below input field.
          register_instance_option :help do
            ""
          end
        end
      end
    end
  end
end
