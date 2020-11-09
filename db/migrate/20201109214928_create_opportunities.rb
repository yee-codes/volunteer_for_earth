class CreateOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunities do |t|
      t.string :organisation
      t.string :title
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
