class Dtc < ApplicationRecord
    validates :shortText, :pCode, :spnFmi, presence: { message: "Cannot create %{model} without %{attribute}" }, uniqueness: true
    validate :spn_fmi_format_is_valid
    validate :p_code_format_is_valid

    def spn_fmi_format_is_valid
        capture = spnFmi.match(/(?<spn>\d+)\/(?<fmi>\d+)/)
        if capture 
            unless capture[:spn].to_i < (2**19 -1)
                errors.add(:spnFmi, "SPN cannot exceed 2**19 - 1")
            end
            unless capture[:fmi].to_i < 31
                errors.add(:spnFmi, "FMI cannot exceed 31")
            end
        else
            errors.add(:spnFmi, "Invalid SPN/FMI format")
        end
    end

    def p_code_format_is_valid
        capture = pCode.match(/[UPB](?<high>[0-9A-F]{4})-(?<low>[0-9A-F]{2})/ )
        if capture 
            unless capture[:high].to_i < 65535
                errors.add(:pCode, "UDS High cannot exceed 65535")
            end
            unless capture[:low].to_i < 255
                errors.add(:pCode, "UDS Low cannot exceed 255")
            end
        else
            errors.add(:pCode, "Invalid PCode format")
        end
    end
end
