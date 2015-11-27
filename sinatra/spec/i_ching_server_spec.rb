require "spec_helper"

describe IChingServer do
  def app
    IChingServer
  end

  before do
    allow_any_instance_of(IChing::Casters::Yarrow).to receive(:generate_lines) { [7, 7, 7, 7, 7, 9] }
    allow_any_instance_of(IChing::Casters::Coins).to receive(:generate_lines) { [8, 8, 8, 8, 8, 6] }
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

  it "GETS /hexagram" do
    get "/api/v1/hexagram"
    expect_200
    expect(response_json["lines"]).to eq [7, 7, 7, 7, 7, 9]
    expect(response_json["stable"]).to eq 1
    expect(response_json["changed"]).to eq 43
  end

  it "GETS /hexagram.:casting_method" do
    get "/api/v1/hexagram.coins"
    expect_200
    expect(response_json["lines"]).to eq [8, 8, 8, 8, 8, 6]
    expect(response_json["stable"]).to eq 2
    expect(response_json["changed"]).to eq 23
  end

  def expect_200
    expect(last_response).to be_ok
  end

  def response_json
    JSON.parse(last_response.body)
  end
end
