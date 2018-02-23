class User < ApplicationRecord
  include Friendlyable
  rolify
  attr_accessor :role
  belongs_to :account
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  
end
