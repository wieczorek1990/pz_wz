require 'RMagick'
require_relative 'writer'
include Magick

class FieldsWriter
  def initialize(input, output, fields)
    unless fields.kind_of?(Array)
      raise 'fields must be an array'
    end
    @input = input
    @output = output
    @fields = fields
  end
  def write
    img = Image.read(@input).first
    @fields.each do |field|
      Writer.write(img, field.x, field.y, field.text, field.width, field.height)
    end
    img.write @output
  end
end