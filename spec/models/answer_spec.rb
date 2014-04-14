require 'spec_helper'

describe Answer do
  it{ should validate_presence_of :answer }
  it { should belong_to :post }
  it {should belong_to :user }
end
