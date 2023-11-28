# frozen_string_literal: true

class RepresentativesController < ApplicationController
  before_action :set_representative

  def index
    @representatives = Representative.all
  end

  def show
    # used other news_items controller as ref
    # @representative var alr set by before_action :set_representative
    @no_img = 'https://static.vecteezy.com/system/resources/previews/005/337/799/non_2x/icon-image-not-found-free-vector.jpg'
  end

  private

  def set_representative
    return unless params[:id]

    @representative = Representative.find(
      params[:id]
    )
  end
end
