require 'rails_helper'

RSpec.describe GeoipHelper, type: :helper do
    @geoipHelper
    context 'translates an IP address' do
      it 'gets US country' do
        def country = helper.identify_country("8.8.8.8")
        expect(country).to eq("US")
      end

      it 'gets Argentina as country' do
        def country = helper.identify_country("190.231.195.24")
        expect(country).to eq("AR")
      end

      it 'gets Brazil as country' do
        def country = helper.identify_country("179.93.224.3")
        expect(country).to eq("BR")
      end
    end
end

