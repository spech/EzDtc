class CreateDtcs < ActiveRecord::Migration[7.0]
  def change
    create_table :dtcs do |t|
      t.string :shortText
      t.string :pCode
      t.string :spnFmi

      t.timestamps
    end
  end
end
