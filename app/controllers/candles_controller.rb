class CandlesController < ApplicationController
  before_action :authenticate_vendor!, only: [:new, :create, :edit, :create, :update, :destroy]

  def index
    @candles = Candle.all
    render :index
  end

  def show
    @candle = Candle.find(params[:id])
    render :show
  end
  
  def new
    @candle = Candle.new
    @candle.build_inventory
    assign_form_values
    render :new
  end

  def create
    @candle = Candle.find_by(id: candle_params[:id])
  
    if @candle
      @candle.inventory.increment!(:count, candle_params[:inventory][:count].to_i)
    else
      @candle = Candle.new(candle_params.except(:inventory))
      @candle.inventory = Inventory.new(count: candle_params[:inventory][:count].to_i)  
    end
  
    if @candle.save
      flash[:success] = 'New candle item successfully added!'
      redirect_to candles_url
    else
      assign_form_values
      flash.now[:error] = 'New Candle item creation failed'
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @candle = Candle.find_by(id: params[:id])
    @candle.build_inventory(count: @candle.inventory.count) unless @candle.inventory
    assign_form_values
    render :edit
  end

  def update
    @candle = Candle.find_by(id: params[:id])

    if @candle.update(candle_params.except(:inventory))
      @candle.inventory.update(count: candle_params[:inventory][:count].to_i)
      flash[:success] = 'Candle item successfully updated!'
      redirect_to candles_url
    else
      assign_form_values
      flash.now[:error] = 'Candle item update failed.'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @candle = Candle.find_by(id: params[:id])

    if @candle
      @candle.destroy
      flash[:success] = 'The candle item was successfully destroyed.'

      if request.referer&.include?('search_filter')
        redirect_to search_filter_path, status: :see_other
      else
        redirect_to candles_url, status: :see_other
      end
    else
      flash[:error] = 'Error: Candle not found.'
      redirect_to candles_url, status: :not_found
    end
  end

  private

  def assign_form_values
    @color_options = ['Red', 'Green', 'Yellow', 'White', 'Pink', 'Black', 'Silver', 'Mixed', 'Other']
    @size_options = ['Small', 'Medium', 'Large']
    @fragrance_options = ['Vanilla', 'Strawberry', 'Chocolate']
    @wax_type_options = ['Soy Wax', 'Bee Wax', 'Honey Wax']
    @pet_type_options = ['Dog', 'Cat']
    @silhouette_options = ['Paw Print', 'Face Only', 'Pose']
    @design_style_options = ['Printed', 'Shaped']
  end

  def candle_params
    params.require(:candle).permit(
      :name, :description, :color, :size, :fragrance, :wax_type,
      :pet_type, :silhouette, :design_style, :price, :image,
      inventory: [:count]
    )
  end
end