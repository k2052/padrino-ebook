require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
  
describe 'Main Controller' do  
  context 'html requests' do
    before(:all) do 
      Stripe::Customer.stubs(:create).returns(OpenStruct.new({id: "#{Faker::Internet.user_name}_#{rand(0...1000)}"}))
      auth = fake_github_auth_hash()
      @account = Account.create_with_omniauth(auth)
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(auth)
      header 'Accept', 'text/html' 
    end

    it 'should respond to index' do
      get '/'
      last_response.status.should eq(200)
    end

    it 'should require login on /authenticated' do
      get '/authenticated'

      last_response.status.should eq(302)
    end

    it 'should allow access to authenticated' do
      get '/auth/github/callback',  {"omniauth.auth" => OmniAuth.config.mock_auth[:github]}
      last_response.status.should eq(302)

      get '/authenticated'
      last_response.status.should eq(200)
    end

    it 'should make a charge' do
      Stripe::Charge.stubs(:create).returns(true)

      get '/auth/github/callback',  {"omniauth.auth" => OmniAuth.config.mock_auth[:github]}
      last_response.status.should eq(302)
      @account.charged.should_not be_true 
      
      post "/charge"
      last_response.status.should eq(302)
      @account.reload
      @account.charged.should be_true 
    end
  end
end
