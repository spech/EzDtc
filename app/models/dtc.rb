class Dtc < ApplicationRecord
    validates :shortText, :pCode, :spnFmi, presence: { message: "Cannot create %{model} without %{attribute}" }, presence: true, uniqueness: true
    validates :pCode, format: { with: /[UPC][0-9A-F]{4}-[0-9A-F]{2}/ , message: "Invalid %{attribute} format"}, presence: true, uniqueness: true
    validates :spnFmi, format: { with: /\d+\/\d+/ , message: "Invalid %{attribute} format"}, presence: true, uniqueness: true
    
end
