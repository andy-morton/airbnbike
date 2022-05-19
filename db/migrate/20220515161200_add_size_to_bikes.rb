class AddSizeToBikes < ActiveRecord::Migration[6.1]
  def change
    add_column :bikes, :size, :string
  end
end
