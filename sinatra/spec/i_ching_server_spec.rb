require "spec_helper"

describe IChingServer do
  def app
    IChingServer
  end

  it "GETS /hexagrams" do
    get "/api/v1/hexagrams"
    expect_200
    expect(response_json.count).to eq 64
  end

  it "GETS /hexagrams/:king_wen_number" do
    get "/api/v1/hexagrams/1"
    expect_200
    expect(response_json["english_name"]).to eq "The Creative"
  end

  it "GETS /trigrams" do
    get "/api/v1/trigrams"
    expect_200
    expect(response_json.count).to eq 8
  end

  it "GETS /trigrams/:number" do
    get "/api/v1/trigrams/1"
    expect_200
    expect(response_json["english_name"]).to eq "The Creative"
  end

  it "GETS /hexagram/:king_wen_number/lines" do
    get "/api/v1/hexagrams/1/lines"
    expect_200
    expect(response_json.count).to eq 6
  end

  it "GETS /hexagram/:king_wen_number/lines/:place" do
    get "/api/v1/hexagrams/1/lines/1"
    expect_200
    expect(response_json["place"]).to eq 1
  end

  def expect_200
    expect(last_response).to be_ok
  end

  def response_json
    JSON.parse(last_response.body)
  end
end
