class User < ApplicationRecord
  include Friendlyable
  rolify
  attr_accessor :role
  belongs_to :account
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :team_memberships
  has_many :teams, through: :team_memberships
  
end
