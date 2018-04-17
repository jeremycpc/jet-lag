class AddMaxCapacityToJets < ActiveRecord::Migration[5.1]
  def change
    add_column :jets, :max_capacity, :integer
  end
end
