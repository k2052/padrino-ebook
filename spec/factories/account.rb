FactoryGirl.define do
  factory :account do
    uid { "#{Faker::Internet.user_name}_#{rand(0...1000)}@example.org" }
    nickname { Faker::Internet.user_name + "_#{rand(0...20000)}" }
    name { Faker::Name.name }
    role 'test'
  end

  factory :account_admin, :parent => :account do
    role 'admin'
  end

  factory :account_striped, :parent => :account do
    role 'striped'
  end
end

def fake_github_auth_hash
	auth = {
		provider: "github",
		uid: "#{Faker::Internet.user_name}_#{rand(0...1000)}@example.org",
		info: {
      name: Faker::Name.name,
  		nickname: Faker::Internet.user_name + "_#{rand(0...20000)}",
  		email: "#{Faker::Internet.user_name}_#{rand(0...1000)}@example.org"
    }
	}
end

def unstriped_account_we_know
  account = Account.find_by_uid("uid")
  if account
    account.update_attributes!(:role => 'registered')
    account.reload
    return account
  else
    account_hash = {
      provider: "github",
      uid:       "uid",
      name:      "Account We Know",
      nickname:  "account",
      email:     "#{Faker::Internet.user_name}_#{rand(0...1000)}@example.org",
      role:      "registered", 
      stripe_id: "stripey"
    }

    return Account.create!(account_hash)
  end
end
