class CreateTrackings < ActiveRecord::Migration[5.2]
  def change
    create_table :trackings do |t|
      t.references :provider, foreign_key: true
      t.string :name
      t.string :code
      t.boolean :validated

      t.timestamps
    end
  end
end
