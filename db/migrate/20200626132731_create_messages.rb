class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.datetime :start_audio
      t.datetime :end_audio
      t.references :user
      t.timestamps
    end
  end
end
