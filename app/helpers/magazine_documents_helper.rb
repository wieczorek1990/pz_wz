module MagazineDocumentsHelper
  def current_number
    current_number = MagazineDocument.where(date: Time.now.beginning_of_year.to_date..Time.now.to_date).maximum(:current_number)
    if current_number.nil?
      current_number = 0
    end
    return current_number + 1
  end
  def image_path(magazine_document)
    '/images/' + magazine_document.id.to_s + '.png'
  end
end
