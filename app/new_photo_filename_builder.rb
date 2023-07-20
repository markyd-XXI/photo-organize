class NewPhotoFilenameBuilder

=begin
For the given parsedLegacyPhotoFilenameArray and sortedLegacyPhotoFilenameArray, build and return a string representation
of the new photo filename format
=end
  def self.buildPhotoFilenames(parsedLegacyPhotoFilenameArray, sortedLegacyPhotoFilenameArray)
    stringOutput = ""
    parsedLegacyPhotoFilenameArray.each do |p|
      order = ""
      numLen = sortedLegacyPhotoFilenameArray[p.cityName].length().digits.length
      sortedLegacyPhotoFilenameArray[p.cityName].each_with_index do |s, i|
        if s == p
          order = i + 1
          break
        end
      end
      stringOutput << "#{p.cityName}#{order.to_s.rjust(numLen, "0")}.#{p.extension} \n"
    end

    return stringOutput
  end
end
