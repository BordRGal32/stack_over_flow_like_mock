require 'spec_helper'

describe Post do
  it {should validate_presence_of :name}
  it {should validate_presence_of :comment}

  it {should belong_to :user}
  it { should have_many :answers }

end
