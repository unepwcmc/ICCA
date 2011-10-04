class Country < ActiveRecord::Base
  has_many :sites
  has_many :photos, :as => :photoable
  has_many :links, :as => :linkable

  validates_presence_of :name, :description, :extended_description

  #get all the countries and sites as json
  def self.country_details_json
    @countries = Country.all

    @json = {}
    @json[:zoom] = 2
    @json[:lat] = @countries.first.lat #This needs thought
    @json[:lng] = @countries.first.lon #This needs thought

    @json[:countries] = []
    @countries.each do |country|
      site_json_hash = {}
      site_json_hash[:name] = country.name
      site_json_hash[:url] = "countries/" + country.id.to_s
      site_json_hash[:value] = country.description
      site_json_hash[:lat] = country.lat
      site_json_hash[:lng] = country.lon
      site_json_hash[:short] = country.name.capitalize[0..2]
      site_json_hash[:sites] = country.sites.size

      site_json_hash[:textSites] = []
      country.sites.each do |site|
        site_details = {}
        site_details[:name] = site.name
        site_details[:url] = "sites/" + site.id.to_s
        site_json_hash[:textSites] << site_details
      end
      @json[:countries] << site_json_hash
    end
    return @json
  end

  #get the sites of the country as json
  def areas_json
    @json = {}
    @json[:id] = self.id
    @json[:country] = self.name
    @json[:country_lat] = self.lat
    @json[:country_lon] = self.lon

    @json[:iccas] = []
    self.sites.each do |site|
      site_details = {}
      site_details[:name] = site.name
      site_details[:url] = "/sites/" + site.id.to_s
      site_details[:lat] = site.lat
      site_details[:lng] = site.lon
      @json[:iccas] << site_details
    end
    return @json
  end
end
