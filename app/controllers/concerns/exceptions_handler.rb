module ExceptionsHandler
  extend ActiveSupport::Concern

  class InvalidToken < StandardError; end
  class MissingToken < StandardError; end
  class AuthenticationError < StandardError; end


  included do
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ActiveRecord::RecordNotFound, with: :four_zero_four
    rescue_from ExceptionsHandler::InvalidToken, with: :four_twenty_two
    rescue_from ExceptionsHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionsHandler::AuthenticationError, with: :four_zero_one
  end

  private
  def four_zero_one(err)
    json_response({message: err.message}, :unauthorized)
  end

  def four_zero_four(err)
    json_response({message: err.message}, :not_found)
  end

  def four_twenty_two(err)
    json_response({ message: err.message}, :unprocessable_entity)
  end

end
