require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
  
describe 'Book Controller' do  
  context 'unauthorized requests' do
    it "should not allow access to the book" do
      get '/book'
      last_response.status.should eq(302) 
    end

    it "should not allow access to a chapter" do
      get '/book/wat'
      last_response.status.should eq(302) 
    end

    it "should allow access to a sample chapter" do 
      get '/sample-chapters/first-chapter'
      last_response.status.should eq(200) 
    end

    it "should return 404 on non-existent chapter" do
      get '/sample-chapters/sample-chapter'
      last_response.status.should eq(404) 
    end
  end

  context 'authorized requests' do
  	before(:each) do
  		stripe_id = "#{Faker::Internet.user_name}_#{rand(0...1000)}"
  		Stripe::Customer.stubs(:create).returns(OpenStruct.new({id: stripe_id}))
      auth = fake_github_auth_hash()
      @account = Account.create_with_omniauth(auth, {role: 'striped', stripe_id: stripe_id})
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth)

      get '/auth/github/callback',  {"omniauth.auth" => OmniAuth.config.mock_auth[:github]}
      last_response.status.should eq(302)
  	end

    it "should allow access to a chapter" do
      get '/book/wat'

      last_response.status.should eq(200) 
    end
  end
end
