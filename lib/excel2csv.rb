require "excel2csv/version"
require "roo"
require "axlsx"
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
      package = Axlsx::Package.new
      style = package.workbook.styles.add_style(xlsx_style)
      package.workbook.add_worksheet(name: basename) do |sheet|
        CSV.foreach(@path, csv_option) do |row|
          sheet.add_row(row.to_a, style: style, types: xlsx_types(row))
        end
      end
      package.use_shared_strings = true
      package.serialize("#{basename}.xlsx")
    end

    private

    # 先頭の 0 が落ちる問題があるため強制的に文字列型とする。
    def xlsx_types(row)
      @xlsx_type ||= Array.new(row.length, :string)
    end

    # フォント指定しないと自動で変なフォントが選ばれることがあるので指定する。
    def xlsx_style
      @xlsx_style ||= {
        font_name: 'メイリオ',
        alignment: { horizontal: :left, wrap_text: true }
      }
    end

    def basename
      File.basename(@path, ".*")
    end
  end
end
