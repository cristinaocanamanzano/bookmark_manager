class Note
  attr_reader :text
  attr_accessor :tag

  def initialize(text, tag = nil)
    @text = text
    @tag = tag
  end

end
