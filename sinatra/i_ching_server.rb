require "sinatra"
require "i_ching"
require "json"
require "sinatra/namespace"
require "sinatra/json"

class IChingServer < Sinatra::Base
  register Sinatra::Namespace

  namespace "/api" do
    namespace "/v1" do
      get "/hexagrams/?:king_wen_number?" do
        content_type "application/json", charset: "utf-8"

        if params[:king_wen_number]
          json IChing::Hexagram.get(params[:king_wen_number].to_i)
        else
          json IChing::Hexagram.all.map(&:to_h)
        end
      end

      get "/hexagrams/:king_wen_number/lines/?:place?" do
        hexagram = IChing::Hexagram.get(params[:king_wen_number])
        if params[:place]
          hexagram.line(params[:place]).to_json
        else
          JSON.generate(hexagram.lines.map(&:to_h))
        end
      end

      get "/trigrams/?:number?" do
        if params[:number]
          IChing::Trigram.get(params[:number].to_i).to_json
        else
          JSON.generate(IChing::Trigram.all.map(&:to_h))
        end
      end
    end
  end
end
