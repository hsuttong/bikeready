class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bikes
  has_many :addresses

  has_many :tranpsorted_bikes, :foreign_key => "transporter_id", :class_name => "Bike"
end
