class CareRecipitent::TopController < ApplicationController
  def index
    @care_recipitents = CareRecipitent.order(created_at: :desc)
  end
end
