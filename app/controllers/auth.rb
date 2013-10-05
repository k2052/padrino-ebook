PadrinoEbook.controllers :auth do
	get :auth, :map => '/auth/:provider/callback' do
	  auth    = request.env["omniauth.auth"]
	  auth.symbolize_keys!

	  account = Account.find_by_provider_and_uid(auth[:provider], auth[:uid]) || Account.create_with_omniauth(auth)
	  set_current_account(account)

	  redirect_back_or_default '/'
	end	
end
