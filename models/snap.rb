class Snap < ActiveRecord::Base
  belongs_to :user
  belongs_to :snappable, :polymorphic => true
  validates :user_id, :uniqueness => { :scope => [:snappable_type, :snappable_id] }
end