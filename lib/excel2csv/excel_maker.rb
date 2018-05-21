require "axlsx"

module Excel2csv
  class ExcelMaker
    # フォント指定しないと自動で変なフォントが選ばれることがあるので指定する。
    STYLE = {
      font_name: 'メイリオ',
      alignment: { horizontal: :left, wrap_text: true }
    }

    def initialize
      @package = Axlsx::Package.new
    end

    def add_sheet(sheet_name, rows)
      @package.workbook.add_worksheet(name: sheet_name) do |sheet|
        rows.each do |row|
          sheet.add_row(row.to_a, style: xlsx_style, types: xlsx_types(row))
        end
      end
    end

    def save(path)
      @package.use_shared_strings = true
      @package.serialize(path)
    end

    private

    # 先頭の 0 が落ちる問題があるため強制的に文字列型とする。
    def xlsx_types(row)
      @xlsx_type ||= Array.new(row.length, :string)
    end

    def xlsx_style
      @xlsx_style ||= @package.workbook.styles.add_style(STYLE)
    end
  end
end
