# require 'spec_helper'

# feature 'Creating a new user' do
#   scenario 'from the new users page you can create a new user account' do
#     visit new_user_path
#     user = FactoryGirl.build(:user)
#     fill_in "Name", :with => user.name
#     fill_in "Password", :with => user.password
#     fill_in "Password confirmation", :with => user.password_confirmation
#     click_on "Create User"
#     page.should have_content "Thank you"
#   end

#   scenario 'from users show page you can edit a user' do
#     user = FactoryGirl.create(:user)
#     visit edit_user_path(user)
#     fill_in "Name", :with => "Tanya"
#     fill_in "Password", :with => user.password
#     fill_in "Password confirmation", :with => user.password_confirmation
#     click_on "Update User"
#     page.should have_content "Updated"
#   end

#   scenario 'from users you can delete a user' do
#     user = FactoryGirl.create(:user)
#     visit user_path(user)
#     click_on "Delete this user"
#     page.should have_content "Here"
#   end
# end
