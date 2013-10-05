PadrinoEbook.controllers :main do
	get :index, :map => '/' do
		render :index
	end

	# This route accesible to logged in users
	get :authenticated, :map => '/authenticated' do
		return "what are your doing here?"
	end

  post :charge, :map => '/charge' do
    # Amount in cents
    @amount = 500

    begin 
      charge = Stripe::Charge.create(
        :amount      => @amount,
        :description => 'Test Charge',
        :currency    => 'usd',
        :customer    => current_account.stripe_id
      )

      current_account.update_attributes(charged: true)

      flash[:info] = "Your payment is being processed by Stripe. Should only take a few minutes."
      redirect_back_or_default '/'
		rescue Stripe::CardError => e
		  flash[:error] = e.message
      redirect_back_or_default '/'
    end
  end
end
