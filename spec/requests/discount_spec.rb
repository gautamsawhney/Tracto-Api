require 'rails_helper'

context "json API" do

  describe "Create" do

    let(:user) { FactoryGirl.create :user } #create
    before(:each) do
      headers = { "CONTENT_TYPE" => "application/json" } #create
      post "/login", '{ "user": { "email": "'+user.email+'", "password": "12345678" } }', headers
    end
    context "with valid attributes" do
      it "should create the discount" do
        expect { post "/api/v1/discounts?auth_token=#{user.authtokens.first.token}", discount: FactoryGirl.build(:discount).attributes.symbolize_keys, format: :json }.to change(Discount, :count).by(1)
      end

      it 'responds with 201' do
        post "/api/v1/discounts?auth_token=#{user.authtokens.first.token}", discount: FactoryGirl.build(:discount).attributes.symbolize_keys, format: :json
        expect(response).to have_http_status(201)
      end
    end

  end  


  describe "Index" do 

    let(:user) { FactoryGirl.create :user } #index
    before(:each) do
      headers = { "CONTENT_TYPE" => "application/json" }
      post "/login", '{ "user": { "email": "'+user.email+'", "password": "12345678" } }', headers
      3.times { FactoryGirl.create :discount}
    end

    it "should fetch the correct number of discounts" do
      get "/api/v1/discounts?auth_token=#{user.authtokens.first.token}", page: 1, per: 2
      expect(json_response.count == 2).to eql(true)
    end

    it "should fetch the correct discounts" do
      get "/api/v1/discounts?auth_token=#{user.authtokens.first.token}", page: 1, per: 2
      json_response1 = json_response.clone
      get "/api/v1/discounts?auth_token=#{user.authtokens.first.token}", page: 2, per: 2
      json_response2 = json_response.clone
      expect(json_response1.collect { |j1| j1['id'] } + json_response2.collect { |j2| j2['id'] }) .to eq(Discount.all.collect(&:id))
    end
        it "responds with 200" do
      get "/api/v1/discounts?auth_token=#{user.authtokens.first.token}", format: :json
      expect(response).to have_http_status(200)
    end

  end

  describe "Show" do 

    let(:user) { FactoryGirl.create :user } #show
    before(:each) do
      headers = { "CONTENT_TYPE" => "application/json" }
      post "/login", '{ "user": { "email": "'+user.email+'", "password": "12345678" } }', headers
      @discount = FactoryGirl.create :discount
    end

    it "should fetch the required discount" do
      get "/api/v1/discounts/#{@discount.id}?auth_token=#{user.authtokens.first.token}", format: :json
      expect(json_response['id']).to eql(@discount.id)
    end
        it "responds with 200" do
      get "/api/v1/discounts/#{@discount.id}?auth_token=#{user.authtokens.first.token}", format: :json
      expect(response).to have_http_status(200)
    end
  end

  describe "Destroy" do 

    let(:user) { FactoryGirl.create :user } #destroy
    before(:each) do
      headers = { "CONTENT_TYPE" => "application/json" }
      post "/login", '{ "user": { "email": "'+user.email+'", "password": "12345678" } }', headers
      @discount = FactoryGirl.create :discount
    end

    it "should delete the required discount" do
      delete "/api/v1/discounts/#{@discount.id}?auth_token=#{user.authtokens.first.token}", format: :json
      expect(response.body.empty?).to eql(true)
    end

    it "responds with 204" do
      delete "/api/v1/discounts/#{@discount.id}?auth_token=#{user.authtokens.first.token}", format: :json
      expect(response).to have_http_status(204)
    end

  end

  describe "Update" do 

    let(:user) { FactoryGirl.create :user } #update
    before(:each) do
      headers = { "CONTENT_TYPE" => "application/json" }
      post "/login", '{ "user": { "email": "'+user.email+'", "password": "12345678" } }', headers
      @discount = FactoryGirl.create :discount
    end

    context "with valid attributes" do
      it "should update the discount" do
        discount = FactoryGirl.attributes_for(:discount)
        discount[:updated_at] = "asdfghj"
        put "/api/v1/discounts/#{@discount.id}?auth_token=#{user.authtokens.first.token}", discount: discount, format: :json
        @discount.reload
        expect(@discount.updated_at).to eq("asdfghj")
      end

      it 'responds with 200' do
        discount = FactoryGirl.attributes_for(:discount)
        discount[:updated_at] = "asdfghj"
        put "/api/v1/discounts/#{@discount.id}?auth_token=#{user.authtokens.first.token}", discount: discount, format: :json
        @discount.reload
        expect(response).to have_http_status(200)
      end
    end

  end
end


