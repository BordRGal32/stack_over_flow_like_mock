require 'spec_helper'
describe User do
  it { should validate_presence_of :name }
  it {should have_many :posts}
  it { should have_many :answers }

  it 'should have a unique name' do
    FactoryGirl.create(:user)
    should validate_uniqueness_of :name
  end

end
