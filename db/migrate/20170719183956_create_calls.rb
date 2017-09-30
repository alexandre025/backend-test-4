class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore'

    create_table :calls do |t|
      t.string :call_id, null: false, length: 45, index: true, unique: true
      t.string :state, null: false, length: 45, index: true
      t.string :from, null: false
      t.string :to, null: false
      t.datetime :completed_at
      t.hstore :call_parameters
      t.timestamps
    end
  end
end
