class Voter < ActiveRecord::Base
  has_secure_password

  validates :name, :presence => true, length: { minimum: 4 }
  validates :email, :presence => true
  validates :password, :length => { :minimum => 4 }, :on => :create

  validates_confirmation_of :password, :on => :create
end
