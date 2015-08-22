require 'spec_helper'

describe Qualification do

  it "should be valid" do
    qua = new_valid_qualification
    qua.should be_valid
  end

end
