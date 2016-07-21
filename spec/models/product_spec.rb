require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:length) }
  it { should validate_presence_of(:width) }
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:weight) }
  it { should validate_presence_of(:weight) }
  it { should validate_numericality_of(:length).only_integer.is_greater_than(0) }
  it { should validate_numericality_of(:width).only_integer.is_greater_than(0) }
  it { should validate_numericality_of(:height).only_integer.is_greater_than(0) }
  it { should validate_numericality_of(:weight).only_integer.is_greater_than(0) }
end
