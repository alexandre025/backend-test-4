# This migration comes from cdx (originally 20170810095038)
class EnableExtensionHstore < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore'
  end
end
