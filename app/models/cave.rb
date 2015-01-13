class Cave < ActiveRecord::Base
	attr_accessible :address1, :address2, :city, :country, :details, :name, :postal, :state, :lat, :lon
end
