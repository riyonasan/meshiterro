class ApplicationController < ActionController::Base
  before_action :search
  def search
    if params[:q] != nil
      words =  params[:q]['genres_genre_name_or_shop_name_or_area_area_name_cont_any'].split(/[[:space:]]/)
      word_queries = words.map do |word|
        Shop.includes(:genres,:area).ransack(genres_genre_name_or_shop_name_or_area_area_name_cont_any: word).result(distinct:true)
      end
      @query = Shop.includes(:genres,:area).ransack(params[:q])
      @shop_res = word_queries.inject(Shop.includes(:genres,:area)){|scope, query| scope.merge(query)}
    else
      @query = Shop.joins(:genres,:area).ransack(params[:q])
      @shop_res = @query.result(distinct:true)
    end
  end
  
end
