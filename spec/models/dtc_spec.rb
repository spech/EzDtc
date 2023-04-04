require 'rails_helper'


RSpec.describe Dtc, type: :model do
  it "is valid with valid attributes" do
    dtc = Dtc.new(shortText: "Anything you want is ok",pCode: "P1234-1A", spnFmi: "1234/3")
    expect(dtc).to be_valid
  end

  it "is not valid without a shortText" do
    dtc = Dtc.new(shortText: nil, pCode: "P1234-AB", spnFmi: "1234/3")
    expect(dtc).not_to be_valid
  end


  it "is not valid format if SPN is too big" do
    dtc = Dtc.new(shortText: "Anything you want is ok",pCode: "P1234-1A", spnFmi: "1234567899/3")
    expect(dtc).not_to be_valid
  end

  it "is not valid format if FMI is too big" do
    dtc = Dtc.new(shortText: "Anything you want is ok",pCode: "P1234-1A", spnFmi: "1234/33")
    expect(dtc).not_to be_valid
  end

  it "is not valid format if PCode High is too big" do
    dtc = Dtc.new(shortText: "Anything you want is ok",pCode: "P12345-1A", spnFmi: "1234/3")
    expect(dtc).not_to be_valid
  end

  it "is not valid format if PCode Low is too big" do
    dtc = Dtc.new(shortText: "Anything you want is ok",pCode: "P1234-4A", spnFmi: "1234/3")
    expect(dtc).not_to be_valid
  end

  it "is not valid format if ShortText is not a sentence" do
    dtc = Dtc.new(shortText: "AAnything" ,pCode: "P1234-1A", spnFmi: "1234/3")
    expect(dtc).not_to be_valid
  end
end

