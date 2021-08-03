module GeoipApiHelper

    attr_reader :geoip

    def identify_country(ip_address)
       geoip.country(ip_address).country_code2
    end

    def geoip
        @geoip ||= GeoIP.new('./GeoIP.dat')
    end
end