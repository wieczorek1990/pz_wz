require 'securerandom'
require 'tmpdir'

class PdfWriter
  def initialize(output, source, supplier, commodity, quanity_gross, quanity_tare, quanity_net, date, current_number, humidity, contamination, type, vehicle_number)
    @tmp = '/tmp'
    @output = output
    @source = source
    @supplier = supplier
    @commodity = commodity
    @quanity_gross = quanity_gross
    @quanity_tare = quanity_tare
    @quanity_net = quanity_net
    @date = date
    @current_number = current_number
    @humidity = humidity
    @contamination = contamination
    @type = type
    @vehicle_number = vehicle_number
  end
  def write
    input = @source + (@type.downcase + '.tex')
    file = File.new(input, 'r')
    content = file.read
    file.close
    content.gsub!('\current_number', @current_number)
    content.gsub!('\date', @date)
    content.gsub!('\supplier', @supplier)
    content.gsub!('\vehicle_number', @vehicle_number)
    content.gsub!('\humidity', @humidity)
    content.gsub!('\contamination', @contamination)
    content.gsub!('\commodity', @commodity)
    content.gsub!('\quanity_gross', @quanity_gross)
    content.gsub!('\quanity_tare', @quanity_tare)
    content.gsub!('\quanity_net', @quanity_net)
    Dir.mktmpdir do |dir|
      file_name = SecureRandom.hex
      file_path = dir + File::SEPARATOR + file_name
      tex_path =  file_path + '.tex'
      pdf_path = file_path + '.pdf'
      file = File.new(tex_path, 'w')
      file.write(content)
      file.close
      system("cd #{dir}; pdflatex #{file_name}; cd -; mv #{pdf_path} #{@output}")
    end
  end
end