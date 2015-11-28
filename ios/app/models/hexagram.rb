class Hexagram
  def self.load_async(&block)
    AFMotion::JSON.get("http://iching.dev.com:9393/api/v1/hexagrams") do |result|
      block.call(result.object)
    end
  end
end
