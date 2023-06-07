class Logo
  attr_reader :logo_thumb_url

  def initialize(data)
    @logo_thumb_url = data[:urls][:thumb]
  end
end