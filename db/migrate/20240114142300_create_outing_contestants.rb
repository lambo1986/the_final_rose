class CreateOutingContestants < ActiveRecord::Migration[7.0]
  def change
    create_table :outing_contestants do |t|
      t.references :outing, null: false, foreign_key: true
      t.references :contestant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
