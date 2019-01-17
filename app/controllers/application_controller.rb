class ApplicationController < ActionController::Base
  before_action :search
  def search
  @query = Shop.search(params[:q])
  @shop_res = @query.result(distinct: true)
  end
end
