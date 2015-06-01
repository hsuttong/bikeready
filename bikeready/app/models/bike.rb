class Bike < ActiveRecord::Base
  belongs_to :user
  belongs_to :transporter, :class_name => "User"
end
