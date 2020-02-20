class CreateProductAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :product_attachments do |t|
      t.string :attachment
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
