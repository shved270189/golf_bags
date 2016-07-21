class Product
  include Mongoid::Document

  field :name, type: String
  field :type, type: String
  field :length, type: Integer
  field :width, type: Integer
  field :height, type: Integer
  field :weight, type: Integer
  field :volume, type: Integer

  validates :name, :type, :length, :width, :height, :weight, presence: true
  validates_numericality_of :length, :width, :height, :weight, only_integer: true, greater_than: 0

  before_save do |document|
    document.volume = length * height * weight
  end
end
