class Notebook
  attr_reader :notes
  def initialize
    @notes = []
  end

  def save(note)
    @notes << note
  end

  def search(desired_tag)
    @notes.select { |note| desired_tag == note.tag}
  end
end
