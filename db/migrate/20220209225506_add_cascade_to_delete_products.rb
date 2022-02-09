class AddCascadeToDeleteProducts < ActiveRecord::Migration
  def change
    remove_foreign_key "line_items", "products"
    add_foreign_key "line_items", "products", on_delete: :cascade
  end
end
