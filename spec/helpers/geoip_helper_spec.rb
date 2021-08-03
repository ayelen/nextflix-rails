require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GeoipHelper. For example:
#
# describe GeoipHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe GeoipHelper, type: :helper do
    context 'before publication' do  # (almost) plain English
      it 'cannot have comments' do   #
        expect(true).to be_truthy  # test code
      end
    end
end

