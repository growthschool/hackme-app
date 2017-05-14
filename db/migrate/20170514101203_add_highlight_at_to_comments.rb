class AddHighlightAtToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :highlight_at, :datetime
  end
end
