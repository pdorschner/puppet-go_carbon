Puppet::Functions.create_function(:'latest_version') do
#https://github.com/lomik/go-carbon/releases/download/v0.14.0/go-carbon-0.14.0-1.%{facts.os.architecture}.rpm

dispatch :latest_version do
  param 'String', :key
end

  def latest_version(key)
    require 'open-uri'

    #@uri = "https://github.com/lomik/go-carbon/releases"

    if open(key) == true
      @connection = exec('curl --silent https://github.com/lomik/go-carbon/releases/latest | grep -oP "v.+\d"')
      puts @connection
    else
     # @connection = exec('curl --silent https://github.com/lomik/go-carbon/releases/latest | grep -oP "v.+\d"')

      puts "FALSE"
    end
end
