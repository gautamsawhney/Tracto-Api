require 'rails_helper'

describe RestaurantPolicy do
  subject { RestaurantPolicy.new(user, restaurant) }

  let(:restaurant) { Restaurant.create }

  #add_here
context "being a/an restaurant_owner" do
                          let(:user) {  User.create('roles' => 'restaurant_owner', 'email' => 'first@first.com', 'password' => 'abcdabcd') }
                          # Action Specs :: RestaurantOwner
it { should permit_action(:destroy) }
it { should permit_action(:update) }
it { should permit_action(:show) }
it { should permit_action(:create) }
                          # Attribute Specs :: RestaurantOwner
                        end
context "being a/an admin" do
                          let(:user) {  User.create('roles' => 'admin', 'email' => 'first@first.com', 'password' => 'abcdabcd') }
                          # Action Specs :: Admin
it { should permit_action(:destroy) }
it { should permit_action(:update) }
it { should permit_action(:show) }
it { should permit_action(:create) }
                          # Attribute Specs :: Admin
                        end

end
