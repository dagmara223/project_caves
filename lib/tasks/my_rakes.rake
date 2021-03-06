#encoding: utf-8

 desc "Import caves." 
  task :import_caves => :environment do
    File.open("jaskinie_GCS_WGS84.txt", "r").each do |line|
      name, inventory_no, length, depth, denivelation, genesis, inventory_id, x_1992, y_1992, x, y = line.strip.split(";")
      c = Cave.new(:name => name, :inventory_no => inventory_no, :length => length, :depth => depth, :denivelation => denivelation, :genesis => genesis, :inventory_id => inventory_id, :x_1992 => x_1992, :y_1992 => y_1992, :lat => y, :lon => x)
      c.save!
    end
  end

  desc "Import new caves." 
  task :import_new_caves => :environment do
    File.open("jaskinie_test_rake.txt", "r").each do |line|
      name, inventory_no, length, depth, denivelation, genesis, inventory_id, x_1992, y_1992, x, y = line.strip.split(";")

      Cave.where(:name => name, :inventory_no => inventory_no).first_or_create(:name => name, :inventory_no => inventory_no, :length => length, :depth => depth, :denivelation => denivelation, :genesis => genesis, :inventory_id => inventory_id, :x_1992 => x_1992, :y_1992 => y_1992, :lat => y, :lon => x)

    end
  end