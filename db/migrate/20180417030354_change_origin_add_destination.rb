class ChangeOriginAddDestination < ActiveRecord::Migration[5.1]
  def change
    rename_column :jets, :origin, :airport_origin_id
    change_column :jets, :airport_origin_id, 'integer USING CAST(airport_origin_id AS integer)'
    add_column :jets, :airport_destination_id, :integer
  end
end
