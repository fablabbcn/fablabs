class SearchController < ApplicationController
  include LabsSearch
  include ProjectsOperations
  include UsersOperations

  before_action :require_login, except: :index

  def index
    @labs = search_labs(params[:query])
      .page(params['page'])
      .per(params['per'] || 7)

    #@projects = search_projects(params[:query])

    @users = search_users(params[:query])
      .page(params['page'])
      .per(params['per'] || 7)

    @results = @labs + @users

    respond_to do |format|
      format.html
    end
  end
end
