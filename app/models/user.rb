class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :username, :password
  	validates :username, presence: true, uniqueness: true
  		  has_many :borrowings
  has_many :books, through: :borrowings


end

