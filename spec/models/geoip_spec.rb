require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Geoip. For example:
#
# describe Geoip do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Geoip do

  subject(:geoip) { Geoip.new }
  let(:country_cache) { CountryCache.new }

  before do
    allow(country_cache).to receive(:has_ip).and_call_original
    allow(country_cache).to receive(:get_country).and_call_original
    allow(geoip).to receive(:country_cache).and_return(country_cache)
  end
  
  it 'calls the geoip API on a single call' do
    def country = geoip.get_country("8.8.8.8")
    expect(country).to eq('US')
    expect(country_cache).to have_received(:has_ip).once
    expect(country_cache).not_to have_received(:get_country)
  end

  it 'does not call the geoip API on the same address on the next call' do
    geoip.get_country("8.8.8.8")
    def country = geoip.get_country("8.8.8.8")

    expect(country).to eq('US')
    expect(country_cache).to have_received(:has_ip).twice
    expect(country_cache).to have_received(:get_country)
  end

end
