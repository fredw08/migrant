class Business < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, :polymorphic => true

  has_many :business_categories
  has_many :categories, :through => :business_categories
  
  structure do
    name             "The Kernel's favourite fried chickens", :was => :title
    website          "http://www.google.co.za/", :was => [:site, :homepage]
    address          ["11 Test Drive", "Gardens", "Cape Town" ,"South Africa"].join("\n")
    summary          :string
    description      "Founded in 1898", :as => :text
    landline         :string
    mobile           :string
    operating_days   0..6
    date_established :datetime
    date_registered  Date.today - 10.years
    next_sale        (Time.now + 10.days)
    verified         false, :default => false
    location         :type => :string, :limit => 127
    awards           ["Best business 2007", "Tastiest Chicken 2008"]
    managers         :serialized
  end
end
