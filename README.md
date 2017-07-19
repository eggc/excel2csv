# Excel2csv

Mac 版 Excel で xlsx 形式のファイルを開き csv で保存すると、エンコーディングは MacJapanese となる。
MacJapanese は多くのツールでサポートされていないため、取り回しが悪い。
そこで、このプログラムは xlsx 形式のファイルを UTF-8 でエンコーディングした csv 形式で出力する。

## Installation

```
gem install specific_install
gem specific_install https://github.com/egg-chicken/excel2csv.git
```

## Usage

```
excel2csv hoge.xlsx
```
