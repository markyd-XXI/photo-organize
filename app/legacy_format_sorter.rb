class LegacyFormatSorter
=begin
For a given parsedLegacyPhotoFilenameArray
=end
  def self.groupByCitySortByDateAsc(parsedLegacyPhotoFilenameArray)
      sortedPhotos = Hash.new()
      
      parsedLegacyPhotoFilenameArray.each do |legacyPhotoFormat|
        if(sortedPhotos.has_key?(legacyPhotoFormat.cityName))
          sortedPhotos[legacyPhotoFormat.cityName] << legacyPhotoFormat
        else
          sortedPhotos.store(legacyPhotoFormat.cityName, Array.new)
          sortedPhotos[legacyPhotoFormat.cityName] << legacyPhotoFormat
        end
      end

      sortedPhotos.each do |k, v|
        sorted = v.sort_by!{|p| p.dateTime}
        sortedPhotos[k] = sorted
      end

      return sortedPhotos
  end

end
