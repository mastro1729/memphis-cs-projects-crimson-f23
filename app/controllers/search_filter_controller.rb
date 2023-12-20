class SearchFilterController < ApplicationController
      def index
        if params[:search].present?
          @candles = Candle.where("LOWER(description) LIKE ?", "%#{params[:search].downcase}%")
        else
          @candles = Candle.all
        end
        assign_form_values
        filter_candles_by_options
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace("candles", partial: "candles/AllCandles", locals: { candles: @candles }) }
          format.html { render :index }
        end
      end

      def assign_form_values
        @color_options = ['Red', 'Green', 'Yellow','White','Black' ,'Mixed','Other']
        @size_options = ['Small', 'Medium', 'Large']
        @fragrance_options = ['Vanilla', 'Strawberry', 'Chocolate']
        @wax_type_options = ['Soy Wax', 'Bee Wax', 'Honey Wax']
        @pet_type_options = ['Dog', 'Cat']
        @silhouette_options = ['Paw Print', 'Face Only', 'Pose']
        @design_style_options = ['Printed', 'Shaped']
      end
  
      def filter_candles_by_options
        filter_params = params.slice(:color, :size, :fragrance, :wax_type, :pet_type, :silhouette, :design_style)
        filter_params.each do |key, value|
          next unless value.is_a?(Array) && value.any?

          # Clean up and capitalize the values
          cleaned_values = value.map { |v| v.split.map(&:capitalize).join(' ') }

          @candles = @candles.where(key.to_sym => cleaned_values) if key == "color"
          @candles = @candles.where(key.to_sym => cleaned_values) if key == "size"
          @candles = @candles.where(key.to_sym => cleaned_values) if key == "fragrance"
          @candles = @candles.where(key.to_sym => cleaned_values) if key == "wax_type"
          @candles = @candles.where(key.to_sym => cleaned_values) if key == "pet_type"
          @candles = @candles.where(key.to_sym => cleaned_values) if key == "silhouette"
          @candles = @candles.where(key.to_sym => cleaned_values) if key == "design_style"
        end
      end

end