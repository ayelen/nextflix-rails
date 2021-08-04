class CountryCache

    attr_reader :cache

    def initialize() 
      @cache = Hash.new
    end

    def has_ip(ip_address)
      @cache.has_key?(ip_address)
    end

    def get_country(ip_address)
      @cache[ip_address]
    end

    def add_entry(ip_address, country)
      @cache[ip_address] = country
    end
end
