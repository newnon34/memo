# CSVファイルを扱うためのライブラリを読み込み
require "csv" 
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
 # ユーザーの入力値を取得し、数字へ変換
memo_type = gets.to_i

#ファイル名を取得する get_filenameメソッドの定義
def get_filename
  print "拡張子を除いたファイル名を入力してください（例: memo）: "
  gets.chomp
end

#メモの内容を取得する write_new_fileメソッドの定義
def write_new_file(filename)
  puts "メモしたい内容を記入してください"
  puts "記入したらEnterを押します"
  memo = gets.chomp

  CSV.open(filename, "w") do |csv|
    csv << ["メモ"]
    csv << [memo]
  end

  puts "#{filename} を作成しました！"
end

#追記するメモの内容を取得する append_to_fileメソッドの定義
def append_to_file(filename)
  unless File.exist?(filename)
    puts "ファイルが見つかりません。新規作成してください。"
    return
  end

  print "追記するメモを入力してください: "
  memo = gets.chomp

  CSV.open(filename, "a") do |csv|
    csv << [memo]
  end

  puts "#{filename} に追記しました！"
end

#1(新規作成)の場合
if memo_type == 1
  #ファイル名を入力
  filename = get_filename
  write_new_file(filename)

 #2(編集)の場合 
 elsif memo_type == 2
  #ファイル名を入力
  filename = get_filename
  append_to_file(filename)

 #1または2以外の場合
 else
  puts "1か2を入力してください"
end

puts "Enterを押すと終了します..."
gets