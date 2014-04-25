require 'spec_helper'

describe Answer do
  context "associations" do
    it {should belong_to :user}
    it {should belong_to :question}
  end
  context "validations" do
    it {should validate_presence_of :body}
  end
end
