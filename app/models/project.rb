class Project < ActiveRecord::Base
  has_many :tickets, dependent: :destroy
  validates :name, :presence => true
end


# has_many :tickets, dependent: :destroy
#  has_many :tickets, :dependent => :destroy
#  validates :name, :presence => true