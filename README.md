# Excel2csv

Microsoft Excel は下記の問題がある。

1. Mac 版 Excel で xlsx 形式のファイルを開き csv で保存すると、エンコーディングは MacJapanese となる。
   MacJapanese は多くのツールでサポートされていないため、取り回しが悪い。
1. csv 形式のファイルをエクセルで開くと先頭の 0 が消える。

そこで、このプログラムは下記の2つの機能を提供する。

1. xlsx 形式のファイルを UTF-8 でエンコーディングした csv 形式で出力する。
1. csv 形式のファイルを先頭の 0 が消えないようにして xlsx に出力する。

## Installation

```
gem install specific_install
gem specific_install https://github.com/egg-chicken/excel2csv.git
```

## Usage

```.sh
excel2csv hoge.xlsx          # xlsx       -> csv(UTF-8)
csv2excel hoge.csv           # csv(UTF-8) -> xlsx
csv2excel hoge_sjis.csv SJIS # csv(SJIS)  -> xlsx
```
