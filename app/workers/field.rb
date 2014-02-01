class Field
  attr_accessor :text, :x, :y, :width, :height
  def initialize(text, x, y, width, height)
    @text = text
    @x = x
    @y = y
    @width = width
    @height = height
  end
end