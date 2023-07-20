require 'legacy_photo_filename_format'
require 'date'

class PhotoFilenameDataParser

  def initialize(filePath)
    if filePath == ""
      raise ArgumentError
    else
      @photoDataFilePath = filePath
    end
  end

=begin
Processes the contents of the given file line by line and returns
an array of LegacyPhotoFilenameFormat objects representing the data.
=end
  def parseFileContents
    if File.exist?(@photoDataFilePath)
      photoArray ||= []

      File.open(@photoDataFilePath).each_line do |line|
        if(line == "\n")
          next
        else
          legacyFormat = parseLine(line)
        end

        photoArray << legacyFormat
      end

      return photoArray
    else
      raise IOError
    end
  end

=begin
Processes one line of data from the input file and returns a LegacyPhotoFilenameFormat object
=end
  def parseLine(line)
    lineArray = line.split(',')

    parsedFileName = lineArray[0].split('.')
    photoName = parsedFileName[0]
    extension = parsedFileName[1]

    city = lineArray[1].strip!

    dateTime = lineArray[2].split(' ')
    date = dateTime[0]
    time = dateTime[1]

    return LegacyPhotoFilenameFormat.new(photoName, extension, city, date, time)
  end
end


