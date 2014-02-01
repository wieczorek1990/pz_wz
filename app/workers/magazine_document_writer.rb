require_relative 'fields_writer'
require_relative 'field'

class MagazineDocumentWriter
  def initialize(output, source, supplier, commodity, quanity, date, current_number, humidity, contamination, type, vehicle_number, symbol_of_evidence, prof_of_delivery, no, destination)
    @output = output
    @source = source
    @supplier = supplier
    @commodity = commodity
    @quanity = quanity
    @date = date
    @current_number = current_number
    @humidity = humidity
    @contamination = contamination
    @type = type
    @vehicle_number = vehicle_number
    @symbol_of_evidence = symbol_of_evidence
    @prof_of_delivery = prof_of_delivery
    @no = no
    @destination = destination
  end
  def write
    fields = []
    fields.push Field.new(@supplier, 52, 133, 465, 50)
    fields.push Field.new('1.', 52, 229, 26, 20) #wtf
    fields.push Field.new(@commodity, 83, 229, 285, 20)
    fields.push Field.new('kg', 480, 229, 37, 20)
    fields.push Field.new(@quanity, 523, 229, 60, 20)
    fields.push Field.new(@date, 683, 80, 75, 22)
    fields.push Field.new(@current_number, 683, 44, 75, 34)
    fields.push Field.new('wilgotność: ' + @humidity + '%', 83, 250, 285, 20 )
    fields.push Field.new('zanieczyszczenie: ' + @contamination + '%', 83, 270, 285, 20)
    unless @vehicle_number.empty?
      fields.push Field.new('nr pojazdu: ' + @vehicle_number, 83, 398, 285, 20)
    end
    fields.push Field.new(@symbol_of_evidence, 346, 54, 76, 48)
    fields.push Field.new(@prof_of_delivery, 428, 44, 170, 25)
    fields.push Field.new(@no, 428, 80, 95, 25)
    fields.push Field.new(@destination, 524, 134, 235, 46)
    file = @type.downcase + '.png'
    input = @source + file
    FieldsWriter.new(input, @output, fields).write
  end
end