module Excel2csv
  class CsvEncoder
    OPTIONS = {
      undef: :replace,
      replace: "?",
      internal_encoding: "UTF-8"
    }

    def initialize(path)
      @path = path
    end

    def call(before_encoding, after_encoding, to)
      File.open(@path, 'r', external_encoding: before_encoding, **OPTIONS) do |file|
        File.open(to, "wb", external_encoding: after_encoding, **OPTIONS) do |new_file|
          new_csv = CSV.new(new_file)
          CSV.new(file).each do |row|
            new_csv << row
          end
        end
      end
    end
  end
end
