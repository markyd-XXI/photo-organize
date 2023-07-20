require './photo_filename_data_parser'
require './legacy_format_sorter'
require './new_photo_filename_builder'

begin
  photoFilenameParser = PhotoFilenameDataParser.new("./sample-photo-data.txt")
rescue ArgumentError => e
  puts "Photo Data Filepath Must Be Defined! #{e}"
  exit
end

begin
  parsedLegacyPhotoFilenameArray = photoFilenameParser.parseFileContents
  sortedLegacyPhotoFilenameArray = LegacyFormatSorter.groupByCitySortByDateAsc(parsedLegacyPhotoFilenameArray)
  puts NewPhotoFilenameBuilder.buildPhotoFilenames(parsedLegacyPhotoFilenameArray, sortedLegacyPhotoFilenameArray)
rescue IOError => e
  puts "Invalid Photo Data Filepath! #{e}"
  exit
end
