# v. 0.5
#
# by Florian Scheuer
# florian-scheuer.de
#
# Currently, only SDS user is an object
# All other SDS objects are returned as arrays
#
#

require 'rest_client'
require 'json'

class SecureDataSpaceUser
  
  attr_reader :auth_token, :id, :login, :first_name, :last_name, :title, :gender, :customer_id, :customer_name, :raw
  PATH = "/api/v3"
  
  def initialize(sds, auth_token)
    @auth_token = auth_token
    @sds = sds
    
    begin
      api = "/user/account"
      response = RestClient.get "#{sds.host}#{PATH}#{api}", {:accept => :json, 'X-Sds-Auth-Token' => @auth_token}

      @raw =JSON.parse(response)
      @id = @raw["id"]
      @login = @raw["login"]
      @first_name = @raw["firstName"]
      @last_name = @raw["lastName"]
      @title = @raw["title"]
      @gender = @raw["gender"]
      @customer_id = @raw["customer"]["id"]
      @customer_name = @raw["customer"]["name"]
      
    rescue
      puts $!
    end
    
  end
  
  
  def to_s
    @login
  end
  
  
  def customer
    @raw["customer"]
  end
  
  
  def logout
    @sds.logout
  end
  
  
end
