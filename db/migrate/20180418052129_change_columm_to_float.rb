class ChangeColummToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :airports, :lat, 'float USING CAST(lat AS float)'
    change_column :airports, :lon, 'float USING CAST(lon AS float)'
  end
end
