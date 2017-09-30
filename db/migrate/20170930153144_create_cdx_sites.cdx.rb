# This migration comes from cdx (originally 20170810095039)
class CreateCdxSites < ActiveRecord::Migration[5.1]
  def change
    create_table :cdx_sites do |t|
      t.jsonb :name_translations, null: false, default: {}
      t.string :code, limit: 45, null: false
      t.string :domain, limit: 45, null: false
      t.json :settings
      t.boolean :default, default: false
    end
  end
end
