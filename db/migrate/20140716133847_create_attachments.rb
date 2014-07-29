class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.belongs_to :post
      t.belongs_to :tag
      t.timestamps
    end
  end
end