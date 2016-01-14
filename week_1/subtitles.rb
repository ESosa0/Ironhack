require 'pry'

class Parser
  def parse_srt
    contents = IO.read("subtitles.srt")
    parsed_contents = contents.split("\n")
    DataSorter.new.sort_data(parsed_contents)
  end
end

class DataSorter
  def sort_data(parsed_contents)
    parsed_contents.each do |i|
      puts i #need to extract postion 1+3 of array. Establish counter that starts at 1 +=3. If counter>3 counter = 1
    end
  end
end

Parser.new.parse_srt




# puts parsed_contents[1]
# puts parsed_contents[1+3]
# time_array =parsed_contents[i]+3