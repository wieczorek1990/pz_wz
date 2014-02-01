require 'RMagick'
include Magick

class Writer
  DEFAULT_POINTSIZE = 18
  DEFAULT_FONT_FAMILY = 'Arial'
  DEFAULT_GRAVITY = WestGravity
  SPACING = 5

  def self.write(img, x, y, text, width, height)
    dy = 0
    lines_count = text.count("\n")

    pointsize_height = DEFAULT_POINTSIZE
    d = dimension('TEST', pointsize_height)
    while d.h * lines_count > height
      pointsize_height -= 1
      d = dimension('TEST', pointsize_height)
    end

    text.each_line do |line|

      oointsize_width = pointsize_height
      d = dimension(line, oointsize_width)
      while d.w > width
        oointsize_width -= 1
        d = dimension(line, oointsize_width)
      end

      line.chomp!
      write_text(img, x, y + dy, line, width, d.h, oointsize_width)
      dy += pointsize_height + SPACING
    end
  end

  private

  class Dimension
    attr_accessor :w, :h
    def initialize(w, h)
      @w = w
      @h = h
    end
  end

  def self.write_text(img, x, y, text, width, height, pointsize)
    image = Image.new(width, height)
    draw = new_draw(pointsize)
    draw.annotate(image, 0, 0, 0, 0, text)
    img.composite!(image, x, y, DarkenCompositeOp)
  end

  def self.dimension(text, pointsize)
    img = Image.new(0, 0)
    draw = new_draw(pointsize)
    draw.text(0, 0, text)
    metrics = draw.get_type_metrics(text)
    return Dimension.new(metrics.width, metrics.height)
  end

  def self.new_draw(pointsize)
    draw = Draw.new
    draw.font_family = DEFAULT_FONT_FAMILY
    draw.gravity = DEFAULT_GRAVITY
    draw.pointsize = pointsize
    return draw
  end
end