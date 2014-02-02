class CreateMagazineDocuments < ActiveRecord::Migration
  def change
    create_table :magazine_documents do |t|
      t.references :supplier, index: true
      t.references :commodity, index: true
      t.integer :quanity_gross
      t.integer :quanity_tare
      t.integer :quanity_net
      t.date :date
      t.integer :current_number
      t.decimal :humidity
      t.decimal :contamination
      t.string :document_type
      t.string :vehicle_number

      t.timestamps
    end
  end
end
