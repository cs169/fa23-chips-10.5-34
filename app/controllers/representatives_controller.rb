# frozen_string_literal: true

class RepresentativesController < ApplicationController
  before_action :set_representative

  def index
    @representatives = Representative.all
  end

  def show
    # used other news_items controller as ref
    # @representative var alr set by before_action :set_representative
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end
end
