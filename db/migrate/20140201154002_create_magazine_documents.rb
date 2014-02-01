class CreateMagazineDocuments < ActiveRecord::Migration
  def change
    create_table :magazine_documents do |t|
      t.references :supplier, index: true
      t.references :commodity, index: true
      t.integer :quanity
      t.date :date
      t.integer :current_number
      t.decimal :humidity
      t.decimal :contamination
      t.string :document_type
      t.string :vehicle_number
      t.string :symbol_of_evidence
      t.string :prof_of_delivery
      t.string :no
      t.string :destination

      t.timestamps
    end
  end
end
