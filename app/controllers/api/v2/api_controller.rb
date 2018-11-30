class Api::V2::ApiController < RocketPants::Base
  version 2

  include ActionController::Head
  include Doorkeeper::Rails::Helpers

  map_error! ActiveRecord::RecordNotFound, RocketPants::NotFound

  before_action :doorkeeper_authorize!

protected


  def paginate(scope, default_per_page = 10)
    collection = scope.page(params[:page]).per((params[:per_page] || default_per_page).to_i)

    current, total, per_page = collection.current_page, collection.total_pages, collection.limit_value

    pagination = {
      self:     current,
      per_page: per_page,
      pages:    total,
      count:    collection.total_count
    }
    if current > 1 then
      pagination[:prev] =  current - 1
    end
    if current != total then
      pagination[:next] =  current + 1
    end
    
    return [
      collection,
      pagination
    ]
  end

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def current_user
    if doorkeeper_token
      @current_user ||= User.find(doorkeeper_token.resource_owner_id)
    end
  end

  def not_implemented
    {
      "errors": [
        {
          status: "500",
          title: "Not implemented",
          detail: "Apologies, this method is not yet implemented"
        }
      ] 
    }
  end
end
