class Gif < ActiveRecord::Base
  belongs_to :category

  def get_giffy(search_word)
    url = "http://api.giphy.com/v1/gifs/search?q=#{search_word}&api_key=dc6zaTOxFJmzC"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)

    self.category = Category.find_by(name: search_word)
    self.image_path = result["data"][0]["embed_url"]
  end
end
