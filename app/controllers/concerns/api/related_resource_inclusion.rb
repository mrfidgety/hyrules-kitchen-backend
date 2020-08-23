module Api
  module RelatedResourceInclusion
    extend ActiveSupport::Concern

    included do
      before_action :assert_action_permits_inclusions!
      before_action :assert_inclusions_valid!

      private

      def assert_action_permits_inclusions!
        return if params[:include].blank? || action_permits_inclusions?

        raise ActionController::BadRequest, 'Related resource inclusion is not permitted'
      end

      def assert_inclusions_valid!
        return if params[:include].blank? || inclusions_valid?

        raise ActionController::BadRequest, 'Inclusions invalid'
      end

      def action_permits_inclusions?
        actions_permitting_included_resources.include?(params[:action])
      end

      def inclusions
        return [] unless params[:include]

        params[:include].split(',').map(&:underscore)
      end

      def inclusions_valid?
        inclusions.all? { |inclusion| permitted_inclusions_for_action.include?(inclusion) }
      end

      def permitted_inclusions_for_action
        public_send("permitted_#{params[:action]}_inclusions")
      end
    end

    class_methods do
      def enable_inclusions_for(actions = {})
        define_method('actions_permitting_included_resources') { actions.keys.map(&:to_s) }

        define_action_specific_inclusions(actions)
      end

      def define_action_specific_inclusions(actions)
        actions.each do |action, fields|
          define_method("permitted_#{action}_inclusions") { fields.map(&:to_s) }
        end
      end
    end
  end
end
