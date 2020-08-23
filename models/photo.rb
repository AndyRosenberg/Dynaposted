class Photo < ActiveRecord::Base
  has_one :post, :as => :content
  has_one :user, :through => :posts
end