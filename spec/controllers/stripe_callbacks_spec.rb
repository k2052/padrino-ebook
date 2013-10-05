require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
  
describe 'Stripe Controller' do  
  it 'should add the stripe role to an account' do
    account = unstriped_account_we_know()
    Stripe::Event.stubs(:retrieve).returns(
      OpenStruct.new(
        type: 'charge.succeeded',
        customer: OpenStruct.new({
          id: account.stripe_id
        })))

    json = File.read(File.expand_path(File.dirname(__FILE__) + '/../fixtures/stripe_webhooks/charge_succeeded.json'))
    post "/stripe/callback/#{ENV['STRIPE_WEBOOK_ID']}", json
    account.reload
    account.role.should == "striped"
	end
end
