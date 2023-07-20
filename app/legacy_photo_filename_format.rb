class LegacyPhotoFilenameFormat
  attr_accessor :photoName, :extension, :cityName, :date, :time, :dateTime
  @photoName = ""
  @extension = ""
  @cityName = ""
  @date = ""
  @time = ""
  @dateTime = ""

  def initialize(photoName, extension, city, date, time)
    @photoName = photoName
    @extension = extension
    @cityName = city
    @date = date
    @time = time
    @dateTime = DateTime.parse "#{date} #{time}"
  end
end
