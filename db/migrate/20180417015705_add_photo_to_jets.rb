class AddPhotoToJets < ActiveRecord::Migration[5.1]
  def change
    add_column :jets, :photo, :string
  end
end
