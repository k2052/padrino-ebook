class Account   
	include MongoMapper::Document

	# Keys
	key :provider,   String
	key :uid,        String
	key :name,       String
	key :nickname,   String
	key :email,      String
	key :role,       String  
	key :stripe_id,  String
	key :charged,    Boolean

	def self.create_with_omniauth(auth, props={})
		create!( 
	    {
		    provider:  auth[:provider], 
		    uid:       auth[:uid],
		    name:      auth[:info][:name],
		    nickname:  auth[:info][:nickname],
		    email:     auth[:info][:email], 
		    role:      'registered'
		  }.merge!(props)
		)
	end

	##
	# Validations
	# 
	validates_presence_of :uid

	##
	# Callbacks
	#
	before_save :create_on_stripe, if: :create_on_stripe_required?

	def create_on_stripe
		customer = Stripe::Customer.create(
	    :description => "Customer #{self.name} for site@demo",
	    :email       => self.email,
	    :name        => self.name
	  ) 

	  self[:stripe_id] = customer.id
	end

	def create_on_stripe_required?
		return false if self.stripe_id
		return true
	end
end
