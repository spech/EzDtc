class Dtc < ApplicationRecord
    validates :shortText, :pCode, :spnFmi, presence: { message: "Cannot create %{model} without %{attribute}" }, uniqueness: true
    validates :shortText, format: { with: /\w{2,}/, message: "ShortText is too short"}
    validate :spn_fmi_format_is_valid
    validate :p_code_format_is_valid

    def spn_fmi_format_is_valid
        capture = spnFmi.match(/(?<spn>\d+)\/(?<fmi>\d+)/)
        if capture 
            unless capture[:spn].to_i < 0x7FFFF
                errors.add(:spnFmi, "SPN cannot exceed 2**19 - 1")
            end
            unless capture[:fmi].to_i < 0x1F
                errors.add(:spnFmi, "FMI cannot exceed 31")
            end
        else
            errors.add(:spnFmi, "Invalid SPN/FMI format")
        end
    end

    def p_code_format_is_valid
        capture = pCode.match(/[UPB](?<high>[0-9A-F]{4})-(?<low>[0-9A-F]{2})/ )
        if capture 
            unless capture[:high].to_i(base=16) < 0x1FFF
                errors.add(:pCode, "UDS High cannot exceed 0x1FFF")
            end
            unless capture[:low].to_i(base=16) < 0x3F
                errors.add(:pCode, "UDS Low cannot exceed 0x2F")
            end
        else
            errors.add(:pCode, "Invalid PCode format")
        end
    end
end
