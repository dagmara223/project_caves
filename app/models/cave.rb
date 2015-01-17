class Cave < ActiveRecord::Base
	# attr_accessible :name, :inventory_no, :length, :depth, :denivelation, :genesis, :inventory_id, :x_1992, :y_1992, :lat, :lon
	self.per_page = 3000
end


       