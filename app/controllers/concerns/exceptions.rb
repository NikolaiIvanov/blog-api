module Exceptions
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |r|
      json_response({ message: r.message }, :not_found)
    end

    rescue_from ActiveRecord::RecordInvalid do |r|
      json_response({ message: r.message }, :unprocessable_entity)
    end
  end
end
