class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: [:show]

  def index
    return [] if params[:latitude].nil? || params[:longitude].nil?

    @stores = Store.within(params[:latitude].to_f, params[:longitude].to_f)
                   .sort_by { |store| store.ratings_average }
                   .reverse
  end

  def show; end

  def update
    @store.attributes = ratings_params

    @store.save!
    render :show
  rescue
    render json: @store.errors.messages
  end

  def destroy
    @store.destroy!
  rescue
    render json: @store.errors, status: :unprocessable_entity
  end

  private

  def set_store
    @store = Store.find_by!(params[:id])
  end
end
