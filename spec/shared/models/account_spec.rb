require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper.rb')
  
describe Account do  
  before do
    Stripe::Customer.stubs(:create).returns(OpenStruct.new({id: "#{Faker::Internet.user_name}_#{rand(0...1000)}"}))
  end

  it 'should save an account model instance' do
    account = FactoryGirl.build(:account)    
    account.save.should be_true
  end 

  it 'should have a stripe_id' do
    account = FactoryGirl.build(:account)    
    account.stripe_id.should be_blank
    account.save.should be_true
    account.reload
    account.stripe_id.should_not be_blank
  end      
     
  it 'should destroy an account' do
    account = FactoryGirl.create(:account)
    account.destroy.should be_true
  end 

  it 'should update an account' do
    account = FactoryGirl.create(:account)
    account.update_attributes!(:name => 'Updated, Guy').should be_true

    account = Account.find_by_id(account.id)
    account.name.should == 'Updated, Guy'
  end 

  it 'should create an account using github method' do
    account = Account.create_with_omniauth(fake_github_auth_hash()) 
    account.should_not be nil
    account.reload
    account.uid.should_not be_blank
  end    
end
