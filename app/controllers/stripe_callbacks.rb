PadrinoEbook.controllers :stripe_webooks do
  before do
    data = MultiJson.load request.body.read, :symbolize_names => true
    
    begin
      @event = Stripe::Event.retrieve(data[:id])
    rescue Exception => e
      halt 200
    end
  end

  post :callback, :map => "/stripe/callback/#{ENV['STRIPE_WEBOOK_ID']}" do
    if @event.type == 'charge.succeeded'
      @account = Account.first(:stripe_id => @event.customer.id)

      unless @account
        # Should Send Off and email to amdin or somthing here. Maybe Airbrake error or wahtever
        halt 200
      end

      @account.role = 'striped'
      @account.save()
    end

    return 200
  end
end
