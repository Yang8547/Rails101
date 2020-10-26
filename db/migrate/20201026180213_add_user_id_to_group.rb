class AddUserIdToGroup < ActiveRecord::Migration[6.0]
  def change
    # add_column(table_name, column_name, type, **options)
    add_column :groups, :user_id, :integer
    
  end
end
