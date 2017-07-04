class CreateSpares < ActiveRecord::Migration[5.1]
  def change
  	create_table :spares do |s|
  		s.text :name
  		s.integer :price
  		s.text :link
  		s.text :description
	end
  end
end
