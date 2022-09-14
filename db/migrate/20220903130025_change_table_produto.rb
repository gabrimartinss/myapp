class ChangeTableProduto < ActiveRecord::Migration[7.0]
  def change
    rename_column :produtos, :qunantidade, :quantidade
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
