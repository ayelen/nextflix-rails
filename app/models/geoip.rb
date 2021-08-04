class Geoip
  include GeoipApiHelper

  attr_accessor :country_cache

  def get_country(ip_address)
    if (country_cache.has_ip(ip_address)) 
      return country_cache.get_country(ip_address)
    end

    country = self.identify_country(ip_address)
    country_cache.add_entry(ip_address, country)
    
    return country
  end

  def country_cache
    @country_cache ||= CountryCache.new
  end
end
