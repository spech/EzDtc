json.extract! dtc, :shortText, :pCode, :spnFmi
json.url dtc_url(dtc.pCode, format: :json)
