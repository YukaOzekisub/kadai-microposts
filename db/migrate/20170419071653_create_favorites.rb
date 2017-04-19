class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :favorite_user, foreign_key: { to_table: :users }
      t.references :favorite_micropost, foreign_key: { to_table: :microposts }

      t.timestamps
      
      t.index [:favorite_user_id, :favorite_micropost_id], unique: true
    end
  end
end
