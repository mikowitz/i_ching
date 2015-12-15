
schema "0001 initial" do

  entity "Hexagram" do
    integer32 :king_wen_number, optional: false
    integer32 :binary, optional: false
    string :english_name, optional: false
    string :chinese_name, optional: false
    string :characters, optional: false
    string :judgement, optional: false
    string :image, optional: false

    has_many :lines
  end

  entity "Line" do
    integer32 :place, optional: false
    string :meaning, optional: false

    belongs_to :hexagram
  end

  entity "Trigram" do
    integer32 :number, optional: false
    binary :binary, optional: false
    string :english_name, optional: false
    string :chinese_name, optional: false
  end

  # Examples:
  #
  # entity "Person" do
  #   string :name, optional: false
  #
  #   has_many :posts
  # end
  #
  # entity "Post" do
  #   string :title, optional: false
  #   string :body
  #
  #   datetime :created_at
  #   datetime :updated_at
  #
  #   has_many :replies, inverse: "Post.parent"
  #   belongs_to :parent, inverse: "Post.replies"
  #
  #   belongs_to :person
  # end

end
