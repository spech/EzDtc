class Dtc < ApplicationRecord
    validates :shortText, :pCode, :spnFmi, presence: { message: "Cannot create %{model} without %{attribute}" }, uniqueness: true
    validates :pCode, format: { with: /[UPB][0-9A-F]{4}-[0-9A-F]{2}/ , message: "Invalid %{attribute} format"}
    validates :spnFmi, format: { with: /\d+\/\d+/ , message: "Invalid %{attribute} format"}
end
