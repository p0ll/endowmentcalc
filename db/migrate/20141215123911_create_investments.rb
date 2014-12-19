class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :description

      t.timestamps
    end
  end
end
