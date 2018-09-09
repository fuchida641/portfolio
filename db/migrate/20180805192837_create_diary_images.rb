class CreateDiaryImages < ActiveRecord::Migration[5.2]
  def change
    create_table :diary_images, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.integer :diary_id
      t.string :diary_image_id

      t.timestamps
    end
  end
end
