require "net/http"
require "uri"
require "rexml/document"

module CentralBankRate
  URL = "http://www.cbr.ru/scripts/XML_daily.asp"

  def self.get_rate_by_id(valute_id)
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)

    doc = REXML::Document.new(response.body)

    doc.elements["//Valute[@ID='#{valute_id}']/Value"]
       .text
       .gsub(/,/, ".")
       .to_f
       .round(2)
  end
end
