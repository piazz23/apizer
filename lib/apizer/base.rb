module Apizer::Base extend ActiveSupport::Concern
    included do
        before_filter :validate_params

		def validate_params
            missing_params      = []

            controller_const    = (params[:controller] + "_controller").camelize.constantize

            required_params     = (controller_const.to_s + "::" + (params[:action].upcase + "_REQUIRE_PARAMS")).constantize rescue []

            if required_params.any?
                required_params.each do |parameter|
                    if parameter.kind_of? Array
                        missing_params << parameter.join("|") if (params.keys - parameter).length == params.keys.length
                    else
                        missing_params << parameter unless params.keys.include?(parameter)
                    end
                end
            end

            render json: {status: 500, :massage => "Missing params: " + missing_params.join(", ")}, :status => 500 if missing_params.any?
        end
	end
end
