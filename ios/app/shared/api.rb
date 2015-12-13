module API
  def self.hexagrams(&block)
    get("hexagrams", &block)
  end

  def self.cast(casting_method, &block)
    get("hexagram.#{casting_method}", &block)
  end

  def self.get(path, &block)
    client.get(path) do |result|
      result.success? ? block.call(result.object) : mp(result.error.localizedDescription)
    end
  end

  def self.client
    @client ||= AFMotion::Client.build("http://iching.dev.com:9393/api/v1/") do
      header "Accept", "application/json"
      response_serializer :json
    end
  end
end
