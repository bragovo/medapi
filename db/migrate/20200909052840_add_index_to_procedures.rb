class AddIndexToProcedures < ActiveRecord::Migration[6.0]
  def change
    # enable_extension :btree_gin
    add_index :procedures, :title, using: :gin
  end
end
