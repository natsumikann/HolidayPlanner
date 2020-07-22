class Item < ApplicationRecord
  has_many :item_tags
  has_many :item_photos
end
