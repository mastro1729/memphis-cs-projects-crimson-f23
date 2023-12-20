# == Schema Information
#
# Table name: candles
#
#  id           :bigint           not null, primary key
#  color        :string
#  description  :text
#  design_style :string
#  fragrance    :string
#  name         :string
#  pet_type     :string
#  price        :integer
#  silhouette   :string
#  size         :string
#  wax_type     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Candle < ApplicationRecord
    validates :name, presence: { message: 'must be provided' }
    validates :description, presence: { message: 'must be provided' }
    validates :color, presence: { message: 'must be selected' }
    validates :size, presence: { message: 'must be selected' }
    validates :fragrance, presence: { message: 'must be selected' }
    validates :wax_type, presence: { message: 'must be selected' }
    validates :pet_type, presence: { message: 'must be selected' }
    validates :silhouette, presence: { message: 'must be selected' }
    validates :design_style, presence: { message: 'must be selected' }
    validates :price, presence: { message: 'must be provided' }

    has_one_attached :image
    has_one :cart_item
    has_one :inventory

    before_destroy :clean_up_associated_records

    # Clean up associated records in other tables before destroying the Candle
    # Find cart_items referencing this Candle and destroy them
    
    def clean_up_associated_records
      clean_up_cart_items
      clean_up_inventory
    end

    def clean_up_cart_items
      CartItem.where(candle_id: id).destroy_all
    end

    def clean_up_inventory
      Inventory.where(candle_id: id).destroy_all
    end

    def image_as_thumbnail
        image.variant(resize_to_limit: [300,300]).processed
    end
end
