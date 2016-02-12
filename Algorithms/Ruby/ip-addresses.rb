# incomplete

class BadIps
  def initialize(file, memory_cap)
    @file = file
    @memory_cap = memory_cap
    @broken_files = []
  end

  def break_up_file
    num_files = @file.size / memory_cap + 1 # + 1 to account for overflow
    line_size = @file.first_line.byte_size

    num_files.times.each do |file_num|
      File.write('w', "file-#{file_num}")
      # write all the lines in it
    end
  end

  def quicksort_file(file)
    # .take creates a shallow copy, it doesn't create a new copy of the string so it takes O(1) time
    File.readlines.sort! do |x1, x2|
      x1.take(15) <=> x2.take(15)
    end
  end

  def giant_merge
    # push first line of each file into a heap
  end
end

