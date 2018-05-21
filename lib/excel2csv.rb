require "excel2csv/version"
require "excel2csv/excel_maker"
require "roo"
require "csv"

module Excel2csv
  class Main
    def initialize(path)
      @path = path
    end

    def validate
      unless File.exist?(@path)
        warn("File not found: #{@path}")
        exit(1)
      end
    end

    def call
      @excel = Roo::Spreadsheet.open(@path)
      @excel.sheets.length.times do |i|
        CSV.open("#{@excel.sheets[i]}.csv", "wb") do |csv|
          @excel.sheet(i).each { |row| csv << row }
        end
      end
    end

    def inverse(csv_option = {})
      excel_maker = ExcelMaker.new
      excel_maker.add_sheet(basename, CSV.read(@path, csv_option))
      excel_maker.save("#{basename}.xlsx")
    end

    private

    def basename
      File.basename(@path, ".*")
    end
  end
end
