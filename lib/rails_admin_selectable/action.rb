module RailsAdmin
  module Config
    module Actions
      class Select < Base
        RailsAdmin::Config::Actions.register(self)

        # Is the action acting on the root level (Example: /admin/contact)
        register_instance_option :root? do
          false
        end

        register_instance_option :collection? do
          false
        end

        # Is the action on an object scope (Example: /admin/team/1/edit)
        register_instance_option :member? do
          true
        end

        register_instance_option :controller do
          proc do
            if params['id'].present?
              begin
                @object = @abstract_model.model.find(params['id'])
                @meth = params[:method]
                @object.send(@meth + '=', params[:value])
                if @object.save
                  if params['ajax'].present?
                    render json: { ok: true }
                  else
                    flash[:success] = I18n.t('admin.toggle.success', attr: @meth)
                  end
                else
                  if params['ajax'].present?
                    render text: @object.errors.full_messages.join(', '), layout: false, status: 422
                  else
                    flash[:error] = @object.errors.full_messages.join(', ')
                  end
                end
              rescue Exception => e
                if params['ajax'].present?
                  render text: I18n.t('admin.toggle.error', err: e.to_s), status: 422
                else
                  flash[:error] = I18n.t('admin.toggle.error', err: e.to_s)
                end
              end
            else
              if params['ajax'].present?
                render text: I18n.t('admin.toggle.no_id'), status: 422
              else
                flash[:error] = I18n.t('admin.toggle.no_id')
              end

            end

            redirect_to :back unless params['ajax'].present?
          end
        end

        register_instance_option :link_icon do
          'icon-move'
        end

        register_instance_option :http_methods do
          [:post]
        end
      end
    end
  end
end
